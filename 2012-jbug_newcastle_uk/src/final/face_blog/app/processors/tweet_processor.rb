class TweetProcessor < TorqueBox::Messaging::MessageProcessor
  include TorqueBox::Injectors

  def on_message(message)
    user = User.find(message[:sender_id])
    (user.friends + [user]).each do |friend|
      friend.messages << Message.new(:body => message[:body], :sender => user)
      friend.save!
    end
  end

  def on_error(exception)
    raise exception
  end
end
