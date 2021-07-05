class TheatreAdminsController < ApplicationController
  def index
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    @theatre = @theatreadmin.theatre
  end

  def theatre_screens
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    @theatre = @theatreadmin.theatre
    @screens = @theatre.screens
    @screen = Screen.new
  end

  def screen_shows
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    @theatre = @theatreadmin.theatre
    @screens = @theatre.screens
    @show = Show.new
  end

  def create_screen
    @screen = Screen.create(screen_params)
    if @screen.save
      redirect_to theatre_admin_theatre_screens_path
    else
      render theatre_admin_theatre_screens_path
    end
  end

  def delete_screen
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    @theatre = @theatreadmin.theatre
    @screen = @theatre.screens.find(params[:id])
    if @screen.destroy
      redirect_to theatre_admin_theatre_screens_path
    else
      render theatre_admin_theatre_screens_path
    end
  end

  def edit
    @theatreadmin = TheatreAdmin.where(user: current_user).first
  end

  def edit_screen
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    @theatre = @theatreadmin.theatre
    @screen = @theatre.screens.find(params[:id])
    if @screen.update(screen_params)
      redirect_to theatre_admin_theatre_screens_path
    else
      render theatre_admin_theatre_screens_path
    end
  end

  def screen_params
    params.require(:screen).permit(:name, :seats, :theatre_id)
  end
end
