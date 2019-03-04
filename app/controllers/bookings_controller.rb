class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @booking.experience = Experience.find(params[:experience_id])
    if @booking.save
      redirect_to(bookings_path)
    else
      render :new
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
