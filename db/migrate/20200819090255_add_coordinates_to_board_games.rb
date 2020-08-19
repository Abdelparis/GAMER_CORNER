class AddCoordinatesToBoardGames < ActiveRecord::Migration[6.0]
  def change
    add_column :board_games, :latitude, :float
    add_column :board_games, :longitude, :float
  end
end
