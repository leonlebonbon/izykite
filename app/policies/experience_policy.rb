class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    user_admin_or_logged?
  end

  def update?
    edit?
  end

  def destroy?
    user_admin_or_logged?
  end

  def my_experiences?
    true
  end

  private

  def user_admin_or_logged?
    user.admin || record.user == user
  end
end
