class CitiesController < ApplicationController
  def index
    @city = City.find(params[:id])
    @theatre = @city.theatres
  end
end
