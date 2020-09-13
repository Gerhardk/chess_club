class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.reference :player_one
      t.reference :player_two
      t.date :date
      t.reference :winner

      t.timestamps
    end
  end
end
