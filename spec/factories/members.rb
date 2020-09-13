FactoryBot.define do
  factory :member, aliases: [:player_one, :player_two] do
    name { "" }
    surname { "" }
    email { "" }
    birthday { "2020-09-13" }
  end
end
