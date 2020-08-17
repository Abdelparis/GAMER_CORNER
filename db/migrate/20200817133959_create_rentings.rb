class CreateRentings < ActiveRecord::Migration[6.0]
  def change
    create_table :rentings do |t|
      t.date :starting_date
      t.date :ending_date
      t.text :review_content
      t.integer :review_rating
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :board_game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
