class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :ten_letters_list
      t.string :word
      t.integer :score
      t.boolean :available
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
