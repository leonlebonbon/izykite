class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @experience = Experience.find(params[:experience_id])
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    @review.experience = Experience.find(params[:experience_id])
    @review.user = current_user
    authorize @review
    redirect_to experience_path(@review.experience)
  end

  private

  def params_review
    params.require(:review).permit(:rating, :content)
  end
end
