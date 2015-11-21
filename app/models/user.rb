class User < ActiveRecord::Base
  attr_accessible :full_name,
                  :preferred_name,
                  :email,
                  :password,
                  :password_confirmation

  validates_presence_of :full_name, :email
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_presence_of :password_confirmation, :if => lambda { |u| u.password.present? }

  has_many :owned_events, :class_name => 'Event', :foreign_key => 'owner_id', :dependent => :destroy
  has_many :requested_events, :class_name => 'Event'
  has_many :joined_events, :class_name => 'Event'
end