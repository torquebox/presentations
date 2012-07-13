class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, :class_name => "User"
  attr_accessible :body, :sender_id, :user_id, :sender
end
