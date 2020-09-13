class Match < ApplicationRecord
  belongs_to :player_one, class_name: 'Member'
  belongs_to :player_two, class_name: 'Member'

  belongs_to :winner, class_name: 'Member'
end
