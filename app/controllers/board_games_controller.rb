class BoardGamesController < ApplicationController
  def index
    @board_games = BoardGame.geocoded.near(params[:search][:address], 15)

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
    @rentings = Renting.where(board_game: @board_game)
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
    @board_game = BoardGame.new(board_game_params)
    authorize @board_game
    @board_game.user = current_user
    respond_to do |format|
      if @board_game.save
        format.html { redirect_to board_game_path(@board_game), notice: 'Board game was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @board_game
  end

  def destroy
    authorize @board_game
  end

  private

  def board_game_params
    params.require(:board_game).permit(:name, :description, :comment, :address, :photo, :price)
  end
end
