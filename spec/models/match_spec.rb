require 'rails_helper'

RSpec.describe Match, type: :model do
  context 'validation test' do
    it 'checks that match is not valid if not all required attributes are filled in' do 
      match = build(:match)
      expect(match.valid?).to eq(false)
    end

    it 'checks that match is valid if all required attributes are filled in' do 
      match = build(:match, player_one: create(:valid_member), player_two: create(:valid_member))
      expect(match.valid?).to eq(true)
    end

    it 'checks that the same player can not be selected for both player one and player two' do
      member = create(:valid_member)
      match = build(:match, player_one: member, player_two: member)
      expect(match.valid?).to eq(false)
      expect(match.errors.full_messages).to include('Player one and Player two can not be the same member')
    end
  end

  context 'calculate player rankings' do
    context 'outcome is a win' do
      before(:each) do
        @member_one = create(:member, name: 'John', surname: 'Doe', email: 'example@example.com', birthday: Date.today)
        @member_two = create(:member, name: 'Jane', surname: 'Doe', email: 'example1@example.com', birthday: Date.today)
      end

      it 'should leave rankings as is if higher ranked player wins' do
        match = create(:match, 
                        player_one: @member_one, 
                        player_two: @member_two, 
                        date: Date.today, 
                        winner_id: @member_one.id, 
                        loser_id: @member_two.id, 
                        outcome: "win")

        expect(@member_one.current_rank).to eq(1)
        expect(@member_two.current_rank).to eq(2)

        match.calculate_rankings

        @member_one.reload
        @member_two.reload
        expect(@member_one.current_rank).to eq(1)
        expect(@member_two.current_rank).to eq(2)
      end

      it 'should update rankings if lower ranked player wins' do
        match = create(:match, 
                        player_one: @member_one, 
                        player_two: @member_two, 
                        date: Date.today,
                        winner_id: @member_two.id,
                        loser_id: @member_one.id, 
                        outcome: "win")

        expect(@member_one.current_rank).to eq(1)
        expect(@member_two.current_rank).to eq(2)

        match.calculate_rankings

        @member_one.reload
        @member_two.reload
        expect(@member_one.current_rank).to eq(2)
        expect(@member_two.current_rank).to eq(1)
      end
    end

    context 'outcome is a draw' do
      before(:each) do
        @member_one = create(:member, name: 'John', surname: 'Doe', email: 'example@example.com', birthday: Date.today)
        @member_two = create(:member, name: 'Jane', surname: 'Doe', email: 'example1@example.com', birthday: Date.today)
      end

      it 'should leave rankings as is if players are adjacent' do
        match = create(:match, 
                        player_one: @member_one, 
                        player_two: @member_two, 
                        date: Date.today, 
                        outcome: "draw")

        expect(@member_one.current_rank).to eq(1)
        expect(@member_two.current_rank).to eq(2)

        match.calculate_rankings

        @member_one.reload
        @member_two.reload

        expect(@member_one.current_rank).to eq(1)
        expect(@member_two.current_rank).to eq(2)
      end

      it 'should update rankings as is if players are not adjacent, player one has lower rank' do
        @member_one.update(current_rank: 10)
        @member_two.update(current_rank: 15)

        match = create(:match, 
                        player_one: @member_one, 
                        player_two: @member_two, 
                        date: Date.today, 
                        outcome: "draw")

        expect(@member_one.current_rank).to eq(10)
        expect(@member_two.current_rank).to eq(15)

        match.calculate_rankings

        @member_one.reload
        @member_two.reload

        expect(@member_one.current_rank).to eq(10)
        expect(@member_two.current_rank).to eq(14)
      end

      it 'should update rankings as is if players are not adjacent, player two has lower rank' do
        @member_one.update(current_rank: 15)
        @member_two.update(current_rank: 10)
        
        match = create(:match, 
                        player_one: @member_one, 
                        player_two: @member_two, 
                        date: Date.today, 
                        outcome: "draw")

        expect(@member_one.current_rank).to eq(15)
        expect(@member_two.current_rank).to eq(10)

        match.calculate_rankings

        @member_one.reload
        @member_two.reload

        expect(@member_one.current_rank).to eq(14)
        expect(@member_two.current_rank).to eq(10)
      end
    end
  end
end
