class Admin::ScreensController < ApplicationController
  def index
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    if @theatreadmin.nil?
      redirect_to theatres_path
    else
    @theatre = @theatreadmin.theatre
    @screens = @theatre.screens
    @screen = Screen.new
    end
    @cities = City.all
  end

  def create
    @screen = Screen.create(screen_params)
    if @screen.save
      redirect_to admin_screens_path
    else
      render admin_screens_path
    end
  end

  def destroy
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    @theatre = @theatreadmin.theatre
    @screen = @theatre.screens.find(params[:id])
    if @screen.destroy
      redirect_to admin_screens_path
    else
      render admin_screens_path
    end
  end

  def edit
    @screen = Screen.find(params[:id])
  end

  def update
    @screen = Screen.find(params[:id])
    if @screen.update(screen_params)
      redirect_to admin_screens_path
    else
      render :admin_screens_path
    end
  end

  def screen_params
    params.require(:screen).permit(:name, :seats, :theatre_id)
  end
end
