FactoryBot.define do
  factory :match do
    date { "2020-09-13" }
    outcome { 1 }
    player_one { nil }
    player_two { nil }
    winner_id { nil }
    loser_id { nil }
  end
end
