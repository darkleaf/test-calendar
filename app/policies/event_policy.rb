class EventPolicy < ApplicationPolicy
  def create?
    !user.guest?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
