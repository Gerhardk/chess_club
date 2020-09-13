require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'validation test' do
    it 'checks that member is not valid if not all required attributes are filled in' do
      member = build(:member, name: 'John')
      expect(member.valid?).to eq(false)
    end

    it 'checks that member is valid if all required attributes are filled in' do
      member = build(:member, name: 'John', surname: 'Doe', email: 'example@example.com', birthday: Date.today)
      expect(member.valid?).to eq(true)
    end
  end

  context 'default values' do
    it 'sets the games play to zero when creating new user' do
      member = create(:member, name: 'John', surname: 'Doe', email: 'example@example.com', birthday: Date.today)
      expect(member.games_played).to eq(0)
    end

    it 'sets the current ranking to first place when there is no other players' do
      member = create(:member, name: 'John', surname: 'Doe', email: 'example@example.com', birthday: Date.today)
      expect(member.current_rank).to eq(1)
    end

    it 'sets the current ranking to last place when there is other members' do
      create(:member, name: 'Member', surname: '1', email: 'example@example.com', birthday: Date.today)
      member = create(:member, name: 'Member', surname: '2', email: 'example2@example.com', birthday: Date.today)
      expect(member.current_rank).to eq(2)
    end
  end
end
