class CitiesController < ApplicationController
  def show
    @id = params[:id]
    @city = City.find(params[:id])
    @user_city = @city.name
  end
end
