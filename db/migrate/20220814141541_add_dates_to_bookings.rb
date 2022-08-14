class AddDatesToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :start_date, :date, null: false
    add_column :bookings, :end_date, :date, null: false
  end
end
