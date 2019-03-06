class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    user_admin_or_logged?
  end

  def destroy?
    user_admin_or_logged?
  end

  def my_hostings?
    true
  end

  def accept?
    record.experience.user == user
  end

  def decline?
    record.experience.user == user
  end

  private

  def user_admin_or_logged?
    user.admin || record.user == user
  end
end
