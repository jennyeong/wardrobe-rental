class ClothPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user.id).order(updated_at: :desc)
      # scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
    # record: the restaurant passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user
  end

  # def mycloset?
  #   # scope.where(user_id: user.id).order(updated_at: :desc)
  #   record.user == user
  # end
end
