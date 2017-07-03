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
    user.admin? || user == record.leader.user
  end

  def render_cable_card?
    true
  end

  def show_roster_list?
    user.admin? || user == record.leader.user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
