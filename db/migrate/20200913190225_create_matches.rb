class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :player_one
      t.references :player_two
      t.date :date
      t.references :winner

      t.timestamps
    end
  end
end
