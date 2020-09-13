require 'rails_helper'

RSpec.describe Match, type: :model do
  context 'validation test' do
    it 'checks that match is valid if all required attributes are filled in' do 
      match = build(:match)
      expect(match.valid?).to eq(true)
    end
  end

  context 'calculate player rankings' do
    # add test here for recalc of rankings
    context 'outcome is a win' do
      it 'should leave rankings as is if higher ranked player wins' do 
        member_one = create(:member, name: 'John', surname: 'Doe', email: 'example@example.com', birthday: Date.today)
        member_two = create(:member, name: 'Jane', surname: 'Doe', email: 'example1@example.com', birthday: Date.today)
        match = create(:match, player_one: member_one, player_two:member_two, date: Date.today, winner_id: member_one.id, loser_id: member_two.id, outcome: "win" )

        expect(member_one.current_rank).to eq(1)
        expect(member_two.current_rank).to eq(2)

        match.calculate_rankings

        member_one.reload
        member_two.reload
        expect(member_one.current_rank).to eq(1)
        expect(member_two.current_rank).to eq(2)
      end

      it 'should update rankings if lower ranked player wins' do 
        member_one = create(:member, name: 'John', surname: 'Doe', email: 'example@example.com', birthday: Date.today)
        member_two = create(:member, name: 'Jane', surname: 'Doe', email: 'example1@example.com', birthday: Date.today)
        match = create(:match, player_one: member_one, player_two:member_two, date: Date.today, winner_id: member_two.id, loser_id: member_one.id, outcome: "win" )

        expect(member_one.current_rank).to eq(1)
        expect(member_two.current_rank).to eq(2)

        match.calculate_rankings

        member_one.reload
        member_two.reload
        expect(member_one.current_rank).to eq(2)
        expect(member_two.current_rank).to eq(1)
      end
    end

    context 'outcome is a draw' do 

    end
  end
end
