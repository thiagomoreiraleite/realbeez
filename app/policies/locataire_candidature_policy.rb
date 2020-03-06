class LocataireCandidaturePolicy < ApplicationPolicy

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def accept_locataire?
    true
  end

  def locataires_locataire?
    true
  end

  def locataires_proprio?
    true
  end

  def locataires_agent?
    true
  end

  def locataires_all?
    true
  end

  def reject_locataire?
    true
  end

  def confirmation_locataire_candidature?
    true
  end

  def confirmation_depot_dossier?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
