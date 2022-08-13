class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.float :total_cost
      t.integer :rent_duration
      t.boolean :rent_approved
      t.references :cloth, null: false, foreign_key: true
      t.references :renter, null: false, index: false
      t.references :rentee, null: false, index: false

      t.timestamps
    end
    add_foreign_key :bookings, :users, column: "renter_id"
    add_foreign_key :bookings, :users, column: "rentee_id"
  end
end
