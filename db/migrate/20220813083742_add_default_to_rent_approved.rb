class AddDefaultToRentApproved < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :rent_approved, false
  end
end
