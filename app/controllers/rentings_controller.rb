class RentingsController < ApplicationController

  def new
    @renting = Renting.new(renting_params)
    @renting.board_game = BoardGame.find(params[:board_game_id])
    @renting.user = current_user
    authorize @renting
  end

  def create
    @renting = Renting.new(renting_params)
    authorize @renting
    @renting.board_game = BoardGame.find(params[:board_game_id])
    @renting.user = current_user
    # @renting.save

    respond_to do |format|
      if @renting.save
        format.html { redirect_to board_game_path(@renting.board_game), notice: 'Renting was successfully created.' }
        # format.json { render :show, status: :created_at, location: @restaurant }
      else
        format.html { render :new }
        # format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_renting
    set_renting
    authorize @renting
  end

  def update_renting
    set_renting
    authorize @renting
    @renting.update(renting_params)
    redirect_to dashboard_path
  end

  def update_accepted
    set_renting
    @renting.status = "validated"
    authorize @renting
    @renting.save
    redirect_to dashboard_path, notice: 'Board Game was successfully accepted.'
  end

  def update_rejected
    set_renting
    @renting.status = "rejected"
    authorize @renting
    @renting.save
    redirect_to dashboard_path, notice: 'Board Game was successfully rejected.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_renting
    @renting = Renting.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def renting_params
    params.require(:renting).permit(:starting_date, :ending_date, :status, :review_rating, :review_content)
  end
end
