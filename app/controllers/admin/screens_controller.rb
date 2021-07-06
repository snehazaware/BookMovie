class Admin::ScreensController < ApplicationController
  before_action :get_theater

  def index
    @screen = Screen.new
  end

  def create
    @screen = Screen.create(screen_params)
    if @screen.save
      redirect_to admin_screens_path
    else
      flash.now[:messages] = @screen.errors.full_messages[0]
      render :index
    end
  end

  def destroy
    @screen = @theatre.screens.find(params[:id])
    if @screen.destroy
      redirect_to admin_screens_path
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
      render :index
    end
  end

  def get_theater
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    @theatre = @theatreadmin.theatre
    @screens = @theatre.screens
  end

  def screen_params
    params.require(:screen).permit(:name, :seats, :theatre_id)
  end
end
