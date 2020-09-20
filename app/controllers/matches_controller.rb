class MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      @match.calculate_rankings
      redirect_to @match, notice: 'Match was successfully created.'
    else
      render :new
    end
  end

  private
  def match_params
    params.require(:match).permit(:player_one_id, :player_two_id, :date, :outcome, :winner_id, :loser_id)
  end
end
