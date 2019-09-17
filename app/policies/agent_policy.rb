class AgentPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    true
  end

  def accept_agent?
    true
  end

  def decline_agent?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
