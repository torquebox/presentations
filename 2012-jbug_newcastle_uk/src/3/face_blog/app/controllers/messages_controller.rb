class MessagesController < ApplicationController
  include TorqueBox::Injectors

  def create
    message = Message.new(params[:message])

    # Enter Messaging Code Here

    redirect_to user_path(current_user)
  end

  def destroy
    Message.destroy(params[:id])
    redirect_to user_path(current_user)
  end
  
end
