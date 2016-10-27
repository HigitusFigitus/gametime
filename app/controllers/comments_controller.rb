class CommentsController < ApplicationController
	def new
    @comment = Comment.new
	end

	def create
    @comment = Comment.new(body: params[:comment][:body], vote: 0, game_id: params[:game_id], user_id: current_user.id)
    @comment.save
    redirect_to game_path(params[:game_id])
	end
end