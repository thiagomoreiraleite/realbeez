class NotificationPolicy < ApplicationPolicy

  def mark_as_read?
    true
  end

  def all_notifications?
    true
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
