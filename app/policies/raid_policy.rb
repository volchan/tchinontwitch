class RaidPolicy < ApplicationPolicy
  def show?
    true
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
