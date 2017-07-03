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

  def edit_tag?
    true
  end

  def render_cable_card?
    true
  end

  def show_roster_list?
    user == user.admin? || record.leader.user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
