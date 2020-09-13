FactoryBot.define do
  factory :match do
    player_one
    player_two
    date { "2020-09-13" }
    winner
  end
end
