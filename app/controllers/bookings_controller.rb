class BookingsController < ApplicationController
  def index
    @booked_seats = []
    @show = Show.find(params[:show_id])
    @show.bookings.each do |s|
      @booked_seats += s.seat_number.try(:split, ",").to_a.map(&:to_i)
    end
    @booking = Booking.new
  
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.save
      redirect_to theatre_show_booking_path(@booking.show.screen.theatre.id,
                                            @booking.show.id, @booking.id)
    else
      render :action => index
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:show_id, :user_id, :is_confirm, :seat_number, :amount)
  end
 
end
