require 'rails_helper'

RSpec.describe Match, type: :model do
  context 'validation test' do
    it 'checks that match is valid if all required attributes are filled in' do 
      match = build(:match)
      expect(match.valid?).to eq(true)
    end
  end

  context 'methods' do

  end
end
