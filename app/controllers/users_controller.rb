class UsersController < ApplicationController
  def my_experiences
    @experiences = policy_scope(Experience).where(user: current_user)
    authorize @experiences
  end

  def show
    @user = current_user
    authorize @user
  end
end
