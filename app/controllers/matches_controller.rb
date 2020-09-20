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
    if @match = Match.create(match_params)
      redirect_to @match, notice: 'Match was successfully created.'
    end
  end

  private
  def member_params
    params.require(:match).permit(:player_one, :player_two, :date, :outcome)
  end
end
