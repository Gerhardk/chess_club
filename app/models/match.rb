class Match < ApplicationRecord
  belongs_to :player_one, class_name: 'Member', foreign_key: 'player_one_id'
  belongs_to :player_two, class_name: 'Member', foreign_key: 'player_two_id'

  validates_with MemberValidator
  validates :date,
            :outcome, presence: true
  enum outcome: [ :win, :draw ]

  def calculate_rankings
    if win?
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
      if !adjacent?(player_one.current_rank, player_two.current_rank)
        if player_one.current_rank > player_two.current_rank
          new_rank = player_one.current_rank - 1
          player_one.update(current_rank: new_rank)
        elsif player_two.current_rank > player_one.current_rank
          new_rank = player_two.current_rank - 1
          player_two.update(current_rank: new_rank)
        end
      end
    end
  end

  def adjacent?(a, b) # Move this to helper or util class
    (a - b).abs == 1
  end

  def winner
    return Member.find(winner_id) if winner_id
  end

  def loser
    return Member.find(loser_id) if loser_id
  end
end
