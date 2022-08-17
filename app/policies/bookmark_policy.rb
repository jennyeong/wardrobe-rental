class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user.id).order(updated_at: :desc)
    end
  end

  def create?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
