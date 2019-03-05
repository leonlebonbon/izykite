class UsersController < ApplicationController
  def my_experiences
    @experiences = policy_scope(Experience).where(user: current_user)
    authorize @experiences
  end
end
