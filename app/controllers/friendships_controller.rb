class FriendshipsController < ApplicationController
	def index

	end
  @task.tags.create()
	def create
    p friend_params
    friend = User.find(friendship_params)
		current_user.friends << friend
    if current_user.save
      redirect_to user_path(friend)
    end
	end

  private
  def friendship_params
    params.permit(:user_id)
  end
end
