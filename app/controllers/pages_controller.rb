class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @params = params[:status]
    @board_games = current_user.board_games
    # @count = rand(0..3)
  end

  def dashboard_renter
    @params = params[:status]

    if !@params.present?
      @renter = current_user.rentings
    elsif @params == "currently"
      @renter = current_user.rentings.where("ending_date::date >=  '#{Date.today}'")
    elsif @params == "history"
      @renter = current_user.rentings.where("ending_date::date < '#{Date.today}'")
    end
  end
end
