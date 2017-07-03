class TagPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.raid.leader.user
  end

  def destroy?
    record.toon.user
  end

  def show_note?
    user.admin? || record.raid.leader.user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
