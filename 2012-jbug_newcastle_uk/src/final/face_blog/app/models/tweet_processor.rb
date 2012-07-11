class TweetProcessor < TorqueBox::Messaging::MessageProcessor
  include TorqueBox::Injectors

  def on_message(body)
    puts "\n\n ======================================"
    puts body.inspect
    puts "==========================================="
  end

  def on_error(exception)
    raise exception
  end
end
