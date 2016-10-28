class GamesController < ApplicationController
	def index
		@tags = Tag.all
	end

	def show
    @game = Game.find(params[:id])
    @comments = @game.comments
    @tag = Tag.find(@game.tag_id)
	end
end
