class FavoritesController < ApplicationController
	def index

	end

	def create

	end


  def destroy
    p params
    favorite = Favorite.find(params[:id])
    user = User.find(params[:user_id])
  end

end
