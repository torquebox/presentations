class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:id])

    current_user.friends << friend
    current_user.save
    redirect_to root_path
  end

  def destroy
    current_user.friends.delete(current_user.friends.find(params[:id]))
    redirect_to root_path
  end
end
