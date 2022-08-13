class AddPriceToCloths < ActiveRecord::Migration[7.0]
  def change
    add_column :cloths, :price, :integer
  end
end
