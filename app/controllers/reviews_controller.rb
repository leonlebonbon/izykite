class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @experience = Experience.find(params[:experience_id])
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    experience = Experience.find(params[:experience_id])
    @review.booking = experience.bookings.find_by(user_id: current_user.id)
    raise
    @review.save
    authorize @review
    redirect_to experience_path(experience)
  end

  private

  def params_review
    params.require(:review).permit(:rating, :content)
  end
end
