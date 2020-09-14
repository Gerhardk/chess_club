class LeaderboardController < ApplicationController
  def show
    @members = Member.order(:current_rank)
  end
end
