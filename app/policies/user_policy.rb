class UserPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def my_friends?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
