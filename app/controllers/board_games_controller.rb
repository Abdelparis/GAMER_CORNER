class BoardGamesController < ApplicationController
  def index
    @params = params[:search]
    if !@params.present?
      @board_games = BoardGame.all
    elsif @params[:name] && @params[:address] && @params[:starting_at] && @params[:expires_at]
      @board_games = BoardGame.where("name ILIKE ?", "%#{@params[:name]}%")
    else
      @board_games = BoardGame.where("name ILIKE ?", "%#{@params[:name]}%")
    end
  end
end
