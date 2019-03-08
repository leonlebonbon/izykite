class ReviewsController < ApplicationController

def create
    @review = Review.new(params_review)
    @experience = Experience.find(params[:experience_id])
    @review.booking = @experience.bookings.find_by(user_id: current_user.id)
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to experience_path(@experience) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'experiences/show' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to experience_path(@review.booking.experience)
  end

  private

  def params_review
    params.require(:review).permit(:rating, :content)
  end
end
