class ParrainPolicy < ApplicationPolicy

  def create?
    true
  end

  def confirmation_parrainage?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
