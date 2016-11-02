class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = Vote.new(votable_type:params[:votable_type],votable_id:params[:votable_id],vote_direction:params[:vote_direction],user_id:current_user.id)
    vote.save
    if request.xhr?
      render "partials/voteform"
    else
      redirect_to game_path(params[:game_id])
    end
  end

  def update
    vote = Vote.find_by(votable_type:params[:votable_type],votable_id:params[:votable_id],user_id:current_user.id)
    game = Game.find(params[:game_id])
    if params[:votable_type] == 'Game'
      type = game
    else
      type = Comment.find(params[:votable_id])
    end
    if vote.vote_direction
      vote.update(vote_direction:false)
    else
      vote.update(vote_direction:true)
    end
    if request.xhr?
      render vote: type.votes.where(vote_direction:true).count.to_json, page:{erb: "partials/_voteform",locals:{ type_name: vote.votable_type, type: type, game_id: game.id },layout:false}
    else
      redirect_to game_path(params[:game_id])
    end
  end

end
