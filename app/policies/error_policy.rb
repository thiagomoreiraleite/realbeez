class ErrorPolicy < ApplicationPolicy

  def not_found?
    true
  end

  def unacceptable?
    true
  end

  def internal_error?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
