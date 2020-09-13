require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'validation test' do
    it 'check that user is not save if not all attributes are filled in' do
      member = build(:member, name: 'John')
      expect(member.valid?).to eq(false)
    end

    it 'check that user is saved if all attributes are filled in' do
      member = build(:member, name: 'John', surname: 'Doe', email: 'example@example.com', birthday: Date.today)
      expect(member.valid?).to eq(true)
    end
  end

  context 'default values' do
    it 'sets the games play to zero when creating new user' do
      member = create(:member, name: 'John', surname: 'Doe', email: 'example@example.com', birthday: Date.today)
      expect(member.games_played).to eq(0)
    end
  end
end
