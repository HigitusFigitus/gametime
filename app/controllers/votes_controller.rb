class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = Vote.new(votable_type:params[:votable_type],votable_id:params[:votable_id],vote_direction:params[:vote_direction],user_id:current_user.id)
    vote.save
    redirect_to game_path(params[:votable_id])
  end

  def update
    p params
    vote = Vote.find_by(votable_type:params[:votable_type],votable_id:params[:votable_id],user_id:current_user.id)
    if vote.vote_direction
      vote.update(vote_direction:false)
    else
      vote.update(vote_direction:true)
    end
    redirect_to game_path(params[:votable_id])
  end

end
