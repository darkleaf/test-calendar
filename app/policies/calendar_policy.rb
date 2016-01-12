class CalendarPolicy < ApplicationPolicy
  def show?
    !user.guest?
  end
end
