class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :all_members, only: [:new, :create]

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      @match.calculate_rankings
      redirect_to matches_path, notice: 'Match was successfully created.'
    else
      render :new
    end
  end

  private
    def match_params
      params.require(:match).permit(:player_one_id, :player_two_id, :date, :outcome, :winner_id, :loser_id)
    end

    def all_members
      @all_members = Member.all.map { |m| [m.fullname, m.id] }
    end

end
