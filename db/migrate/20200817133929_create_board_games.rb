class CreateBoardGames < ActiveRecord::Migration[6.0]
  def change
    create_table :board_games do |t|
      t.string :name
      t.text :description
      t.text :comment
      t.boolean :available
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
