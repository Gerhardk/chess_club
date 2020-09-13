class AddOutcomeToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :outcome, :integer
  end
end
