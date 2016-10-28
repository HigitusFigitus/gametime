class SearchController < ApplicationController
  def index
    @user_results = user_search(lower(params[:search]))
    @game_results = game_search(lower(params[:search]))
  end

  private

  def lower(str)
    str.downcase
  end

  def user_search(keyword)
    results = []
    results << User.where("lower(email) like ?", "%#{keyword}%") if    User.where("lower(email) like ?", "%#{keyword}%").count > 0

    results << User.where("lower(first_name) like ?", "%#{keyword}%") if User.where("lower(first_name) like ?", "%#{keyword}%").count > 0

    results << User.where("lower(last_name) like ?", "%#{keyword}%") if User.where("lower(last_name) like ?", "%#{keyword}%").count > 0

    results << User.where("lower(username) like ?", "%#{keyword}%") if User.where("lower(username) like ?", "%#{keyword}%").count > 0

    return results
  end

  def game_search(keyword)
    results = []
    results << Game.where("lower(name) like ?", "%#{keyword}%") if    Game.where("lower(name) like ?", "%#{keyword}%").count > 0

    return results
  end
end
