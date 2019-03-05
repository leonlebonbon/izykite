class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
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
      redirect_to(my_experiences_path)
    else
      render :new
    end
  end

  def show
    @experience = Experience.find(params[:id])
    authorize @experience
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
    params.require(:experience).permit(:address, :photo, :price_per_day, :name, :minimum_length, :description)
  end
end
