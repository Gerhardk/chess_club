class ApplicationController < ActionController::Base
  def after_sign_in_path_for(users)
    leaderboard_path
  end
end
