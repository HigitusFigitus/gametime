class FriendshipsController < ApplicationController
	def index

	end

	def create
    p"%"*20
    p params
    p friendship_params
    friend = User.find(friendship_params[:user_id])
    current_user.friends << friend
    redirect_to user_path(friend)
  end

  private
  def friendship_params
    params.permit(:user_id)
  end
end
