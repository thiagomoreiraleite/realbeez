class NotificationPolicy < ApplicationPolicy

  def mark_as_read?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
