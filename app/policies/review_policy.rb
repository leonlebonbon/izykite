class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def destroy?
    user_admin_or_logged?
  end

  private

  def user_admin_or_logged?
    user.admin || record.booking.user == user
  end
end
