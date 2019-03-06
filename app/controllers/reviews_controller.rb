class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @experience = Experience.find(params[:experience_id])
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    authorize @review
  end

  private

  def params_review
    params.require(:review).permit(:rating, :content)
  end
end
