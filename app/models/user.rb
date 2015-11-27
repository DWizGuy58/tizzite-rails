class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates_presence_of :provider, :uid, :email, :name, :password
  validates_uniqueness_of :email, :case_sensitive => false
  validates_uniqueness_of :uid

  has_many :owned_events, :class_name => 'Event', :foreign_key => 'owner_id', :dependent => :destroy
  has_many :requested_events, :class_name => 'Event'
  has_many :joined_events, :class_name => 'Event'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image = auth.info.image
      user.location = auth.info.location
      user.token = auth.credentials.token
      user.expires_at = auth.credentials.expires_at
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end