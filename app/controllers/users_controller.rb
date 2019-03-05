class UsersController < ApplicationController
  def my_experiences
    @experiences = policy_scope(Experience).where(user: current_user)
    authorize @experiences
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(params_user)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def params_user
    params.require(:user).permit(:nickname, :email, :photo)
  end
end
