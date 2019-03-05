class ExperiencesController < ApplicationController
  def index
    @experiences = policy_scope(Experience)
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
      redirect_to(experiences_path)
    else
      render :new
    end
  end

  def show
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  private

  def params_experience
    params.require(:experience).permit(:address, :photo, :price_per_day, :name, :minimum_length, :description)
  end
end
