class RemoveWinnerReferenceFromMatches < ActiveRecord::Migration[6.0]
  def change
    remove_reference :matches, :winner
    add_column :matches, :winner_id, :integer
    add_column :matches, :loser_id, :integer
  end
end
