class BoardGamesController < ApplicationController
  def index
    @board_games = BoardGame.geocoded
    @markers = @board_games.map do |board_game|
      {
        lat: board_game.latitude,
        lng: board_game.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { board_game: board_game })
      }
    end

    @board_games = policy_scope(BoardGame).order(created_at: :desc)
    @params = params[:search]
    if !@params.present?
      @board_games = BoardGame.all
    elsif @params[:name] && @params[:address] && @params[:starting_at] && @params[:expires_at]
      @board_games = BoardGame.where("name ILIKE ?", "%#{@params[:name]}%")
    else
      @board_games = BoardGame.where("name ILIKE ?", "%#{@params[:name]}%")
    end
  end

  def show
    @renting = Renting.new
    @board_game = BoardGame.find(params[:id])
    authorize @board_game
  end

  def new
    @board_game = BoardGame.new
    authorize @board_game
  end

  def edit
    authorize @board_game
  end

  def create
    @board_game.user = current_user
    authorize @board_game
  end

  def update
    authorize @board_game
  end

  def destroy
    authorize @board_game
  end
end
