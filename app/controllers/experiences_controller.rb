class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
    @my_experiences = Experience.where(user == current_user)
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(params_experience)
    @experience.user = current_user
    if @experience.save
      redirect_to(experiences_path)
    else
      render :new
    end
  end

  def show
    @experience = Experience.find(params[:id])
  end

  private

  def params_experience
    params.require(:experience).permit(:address, :photo, :price_per_day, :name, :minimum_length, :description)
  end
end
