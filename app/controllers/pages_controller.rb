class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @params = params[:status]
    if !@params.present?
      @rentings = current_user.rentings
    elsif @params == "pending"
      @rentings = current_user.rentings.where(status: @params)
    elsif @params == "validated"
      @rentings = current_user.rentings.where(status: @params)
    elsif @params == "rejected"
      @rentings = current_user.rentings.where(status: @params)
    end
    # @count = rand(0..3)
  end

  def accept
  end
end
