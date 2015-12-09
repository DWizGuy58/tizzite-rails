class Event < ActiveRecord::Base
  attr_accessible :name,
                  :description,
                  :lat,
                  :lon

  validates_presence_of :name, :lat, :lon

  belongs_to :owner, :class_name => 'User'
  has_many :attendees, :class_name => 'User'
  has_many :messages
end