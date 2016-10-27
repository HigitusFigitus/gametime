class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
    @games = @user.games
	end
end
