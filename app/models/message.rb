class Message < ActiveRecord::Base
  attr_accessible :body,
                  :timestamp

  has_one :sender, :class_name => 'User'
end