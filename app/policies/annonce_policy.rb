class AnnoncePolicy < ApplicationPolicy

  def index?
    true
  end

  def mes_annonces?
    true
  end

  def biens_a_gerer?
    true
  end

  def checkout_proprio?
    true
  end

  def checkout_agent?
    true
  end

  def show?
    true
  end

  def create?
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
