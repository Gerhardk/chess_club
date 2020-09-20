FactoryBot.define do
  factory :member, aliases: [:invalid_member] do
    name { "" }
    surname { "" }
    email { "" }
    birthday { "2020-09-13" }
  end

  factory :valid_member, class: Member do 
    name { "John" }
    surname { "Smith" }
    email { "johnsmith@example.com" }
    birthday { "2020-09-13" }
  end
end
