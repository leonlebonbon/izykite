class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    authorize @booking
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
