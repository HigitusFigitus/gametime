class CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

	def new
    @game = Game.find(params[:game_id])
    p '*' * 50
    p params
    p '*' * 50
    @comment = Comment.new
    #respond_to do |format|
    #  format.html {redirect_to game_path(params[:game_id])}
    #  format.json do
    #    p '*' * 50
    #    render partial: 'partials/new_comment_form'
    #    p '*' * 50
     # end
      # format.json {p 'something'}
    #end
    render partial: "new"
	end

	def create
    @comment = Comment.new(body: params[:comment][:body], vote: 0, game_id: params[:game_id], user_id: current_user.id)
    @comment.save
    redirect_to game_path(params[:game_id])
	end
end