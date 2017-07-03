class TagPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user == record.raid.leader.user
  end

  def destroy?
    user == record.toon.user
  end

  def show_note?
    user == user.admin? || record.raid.leader.user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
