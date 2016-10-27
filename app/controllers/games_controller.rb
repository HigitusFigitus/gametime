class GamesController < ApplicationController
	def index
		# @games = Game.all
		# @tags = Game.group(:tag_id).order('count_tag_id desc').count(:tag_id)
		@tags = Tag.all
	end

	def show

	end
end
