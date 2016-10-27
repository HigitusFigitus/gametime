class GamesController < ApplicationController

	def index
		# @games = Game.all
		# @tags = Game.group(:tag_id).order('count_tag_id desc').count(:tag_id)
		@tags = Tag.all
	end

	def show
    @game = Game.find(params[:id])
    @tag = Tag.find(@game.tag_id)
	end

  def update
    @game = Game.find(params[:id])
    p params
    if params[:type] == "up"
      @game.vote += 1
    else
      @game.vote -= 1
    end
    @game.save
    redirect_to @game
  end
end
