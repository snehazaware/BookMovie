class Admin::ShowsController < ApplicationController
  def index
    @theatreadmin = TheatreAdmin.where(user: current_user).first
    @theatre = @theatreadmin.theatre
    @screens = @theatre.screens
    @show = Show.new
  end

  def create
    @show = Show.create(show_params)
    if @show.save
      redirect_to admin_shows_path
    end
  end

  def destroy
    @show = Show.find(params[:id])
    if @show.destroy
      redirect_to admin_shows_path
    else
      render admin_shows_path
    end
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    if @show.update(show_params)
      redirect_to admin_shows_path
    end
  end

  def show_params
    params.require(:show).permit(:movie_id, :screen_id, :date, :time, :amount)
  end

end
