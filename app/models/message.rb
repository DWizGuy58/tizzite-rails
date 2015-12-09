class Message < ActiveRecord::Base
  attr_accessible :body

  belongs_to :event
  has_one :sender, :class_name => 'User'
end