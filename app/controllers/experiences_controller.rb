class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:query].present?
      @experiences = policy_scope(Experience).near(params[:query], 50)
    else
      @experiences = policy_scope(Experience)
    end
    @all_experiences = @experiences.where.not(latitude: nil, longitude: nil)
    @markers = @all_experiences.map do |experience|
      {
        lng: experience.longitude,
        lat: experience.latitude,
        infoWindow: render_to_string(partial: "shared/map", locals: { experience: experience })
      }
    end
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(params_experience)
    authorize @experience
    @experience.user = current_user
    if @experience.save
      redirect_to(my_experiences_path)
    else
      render :new
    end
  end

  def show
    @experience = Experience.find(params[:id])
    authorize @experience
    @review = Review.new
    @user_booking = @experience.bookings.find_by(user: current_user)
    @reviews = []
    @experience.bookings.each do |booking|
      booking.reviews.each do |review|
        @reviews << review
      end
    end
    unless @reviews == []
      @overall_rating = 0
      @reviews.each do |review|
        @overall_rating += review.rating
      end
      @overall_rating /= @reviews.length
    end
    @reviews.reverse!
    @markers = [{
      lng: @experience.longitude,
      lat: @experience.latitude
    }]
  end

  def edit
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def update
    @experience = Experience.find(params[:id])
    authorize @experience
    if @experience.update(params_experience)
      redirect_to my_experiences_path
    else
      render :edit
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    authorize @experience
    @experience.destroy
    redirect_to my_experiences_path
  end

  private

  def params_experience
    params.require(:experience).permit(:address, :photo, :price_per_day, :name, :minimum_stay, :description, :latitude, :longitude)
  end
end
