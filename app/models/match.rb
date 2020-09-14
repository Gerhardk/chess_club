class Match < ApplicationRecord
  belongs_to :player_one, class_name: 'Member'
  belongs_to :player_two, class_name: 'Member'

  enum outcome: [ :win, :draw ]

  def calculate_rankings
    if outcome == "win"
      winner = Member.find(self.winner_id)
      loser = Member.find(self.loser_id)
      if winner.current_rank > loser.current_rank
        winner_new_rank = ((winner.current_rank.to_f - loser.current_rank.to_f) / 2).round
        loser_new_rank = loser.current_rank + 1

        winner.update(current_rank: winner_new_rank)
        loser.update(current_rank: loser_new_rank)
      else
        return
      end
    else
      if player_one.current_rank > player_two.current_rank
        if player_one.current_rank - 1 != player_two.current_rank
          new_rank = player_one.current_rank - 1
          player_one.update(current_rank: new_rank)
        end
      elsif player_two.current_rank > player_one.current_rank
        if player_two.current_rank - 1 != player_one.current_rank
          new_rank = player_two.current_rank - 1
          player_two.update(current_rank: new_rank)
        end
      end
    end
  end
end
