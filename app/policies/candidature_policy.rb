class CandidaturePolicy < ApplicationPolicy

  def create?
    true
  end

  def candidature_agent?
    true
  end

  def candidature_proprio?
    true
  end

  def update?
    record.user == user
  end

   def destroy?
    record.user == user
  end

  def accept_candidature?
    true
  end

  def reject_candidature?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
