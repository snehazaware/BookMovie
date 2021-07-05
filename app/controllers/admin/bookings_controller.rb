class Admin::BookingsController < ApplicationController
  def index
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    @theatre = @theatreadmin.theatre
    @screens = @theatre.screens
  end
end
