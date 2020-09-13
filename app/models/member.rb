class Member < ApplicationRecord
  validates :name,
            :surname, 
            :email,
            :birthday, presence: true
end
