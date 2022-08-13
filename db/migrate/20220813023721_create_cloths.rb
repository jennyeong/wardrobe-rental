class CreateCloths < ActiveRecord::Migration[7.0]
  def change
    create_table :cloths do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :color
      t.boolean :rented
      t.string :brand
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
