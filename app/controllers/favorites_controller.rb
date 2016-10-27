class FavoritesController < ApplicationController
  before_action :authenticate_user!

	def create

	end


  def destroy
    favorite = Favorite.find_by(user_id:params[:user_id],game_id: params[:id])
    favorite.destroy
    redirect_to user_path(current_user)
  end

end
