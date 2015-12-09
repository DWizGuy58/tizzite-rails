class Event < ActiveRecord::Base
  attr_accessible :name,
                  :description,
                  :lat,
                  :lon

  validates_presence_of :name, :lat, :lon

  belongs_to :owner, :class_name => 'User'
  has_many :attendees, :class_name => 'User', :inverse_of => :joined_events
  has_many :requesters, :class_name => 'User', :inverse_of => :requested_events
  has_many :messages, :foreign_key => 'event_id', :dependent => :destroy
end