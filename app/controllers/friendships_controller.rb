class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friend = User.find(friendship_params[:user_id])
    current_user.friends << friend
    redirect_to user_path(friend)
  end

  def destroy
    friendship = Friendship.find_by(user_id:params[:user_id],friend_id:params[:id])
    friendship.destroy
    redirect_to user_path(current_user)
  end

  private
  def friendship_params
    params.permit(:user_id)
  end
end
