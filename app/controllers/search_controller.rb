class SearchController < ApplicationController
  def index
    @user_results = user_search(lower(params[:search]))
    @game_results = game_search(lower(params[:search]))
  end

  private

  def lower(str)
    str.downcase
  end
end
