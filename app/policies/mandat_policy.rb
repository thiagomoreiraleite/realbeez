class MandatPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
