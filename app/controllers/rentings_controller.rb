class RentingsController < ApplicationController
  def new
    @renting = Renting.new
    authorize @renting
  end

  def create
    @renting = Renting.new(renting_params)
    @renting.user = current_user
    authorize @renting
    @renting.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_renting
    @renting = Renting.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def renting_params
    params.require(:renting).permit(:id)
  end
end
