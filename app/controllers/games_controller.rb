class GamesController < ApplicationController
	def index
		@tags = Tag.all
	end

	def show
    @game = Game.find(params[:id])
    @comments = @game.comments
    @tag = Tag.find(@game.tag_id)
    p @comments
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
