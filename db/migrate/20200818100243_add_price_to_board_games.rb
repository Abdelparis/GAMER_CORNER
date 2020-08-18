class AddPriceToBoardGames < ActiveRecord::Migration[6.0]

  def change
    add_column :board_games, :price, :integer
  end
end
