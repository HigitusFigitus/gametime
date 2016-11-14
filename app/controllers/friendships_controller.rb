class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friend = User.find(friendship_params[:user_id])
    current_user.friends << friend
    redirect_to user_path(friend)
  end

  def destroy
    friendship = Friendship.find_by(user_id:params[:user_id],friend_id:params[:id])
    delete_friendship = friendship.destroy
    if request.xhr?
      render json: delete_friendship.friend.id
    else
      redirect_to user_path(current_user)
    end
  end

  private
  def friendship_params
    params.permit(:user_id)
  end
end
