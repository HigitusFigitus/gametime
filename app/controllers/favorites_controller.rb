class FavoritesController < ApplicationController
	def index

	end

	def create
    @favorite = Favorite.new(user_id: current_user.id, game_id: params[:game_id])
	end
end