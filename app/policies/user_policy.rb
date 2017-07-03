class UserPolicy < ApplicationPolicy
  def note?
    user.admin?
  end

  def update_note?
    user.admin?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
