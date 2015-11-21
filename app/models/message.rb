class Message < ActiveRecord::Base
  attr_accessible :body

  has_one :sender, :class_name => 'User'
end