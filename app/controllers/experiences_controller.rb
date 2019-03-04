class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(params_experience)
    @experience.user = current_user
    if @experience.save
      redirect_to(root_path)
    else
      render :new
    end
  end

  private

  def params_experience
    params.require(:experience).permit(:address, :photo, :price_per_day, :name, :minimum_length, :description)
  end
end
