class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @rentings = current_user.renting
    @count = rand(0..3)
  end

end
