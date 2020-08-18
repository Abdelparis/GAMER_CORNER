class BoardGamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @board_games = BoardGame.all
  end
end
