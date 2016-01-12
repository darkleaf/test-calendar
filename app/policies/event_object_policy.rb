class EventObjectPolicy < ApplicationPolicy
  def index?
    !user.guest?
  end
end
