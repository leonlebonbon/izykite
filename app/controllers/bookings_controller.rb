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
    @experience = Experience.find(params[:experience_id])
    @booking.experience = @experience
    @booking.total_price = @booking.experience.price_per_day * @booking.number_of_kiters
    if @booking.save
      redirect_to(bookings_path)
    else
      # raise
      render :new
    end
  end

  def my_hostings
    @my_hostings = current_user.experiences.map { |e| e.bookings }.flatten
    authorize :booking, :create?
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.confirmed = true
    @booking.save
    redirect_to my_hostings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.confirmed = false
    @booking.save
    redirect_to my_hostings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to(bookings_path)
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :number_of_kiters)
  end
end
