class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(rentee_id: user.id).order(updated_at: :desc)
    end
  end

  def create?
    true
  end

  def update?
    record.rentee == user
    # record: the restaurant passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    true
  end

  def approve?
    record.renter == user
  end
end
