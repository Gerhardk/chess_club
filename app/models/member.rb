class Member < ApplicationRecord
  validates :name,
            :surname, 
            :email,
            :birthday, presence: true

  before_create :calculate_ranking

  def calculate_ranking
    self.current_rank = Member.count + 1
  end
end
