class UsersController < ApplicationController
  before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
    @games = @user.games
    @friends = @user.friends
	end
end
