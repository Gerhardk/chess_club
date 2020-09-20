class Member < ApplicationRecord
  validates :name,
            :surname, 
            :email,
            :birthday, presence: true

  before_create :calculate_starting_rank

  def calculate_starting_rank
    self.current_rank = Member.count + 1
  end

  def to_s
    return "#{name} #{surname}"
  end

  def fullname
    return "#{name} #{surname}"
  end
end
