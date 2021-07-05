class BookingsController < ApplicationController
  def index
    @booking_seat = []
    @show = Show.find(params[:show_id])
    @show.bookings.each do |s|
      @booking_seat += s.seat_number.try(:split, ",").to_a.map(&:to_i)
    end
    puts @booking_seat.inspect
    @booking = Booking.new
  
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.save
      redirect_to theatre_show_booking_path(@booking.show.screen.theatre.id,@booking.show.id,@booking.id)
    else
      render theatre_show_bookings_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:show_id, :user_id, :is_confirm, :seats, :amount)
  end
 
end
