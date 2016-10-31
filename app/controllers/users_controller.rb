class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	if request.xhr?
  		p "$"*20
  		p params
  	else
  	end
    @user = User.find(params[:id])
    @games = @user.games
    @friends = @user.friends
  end
end
