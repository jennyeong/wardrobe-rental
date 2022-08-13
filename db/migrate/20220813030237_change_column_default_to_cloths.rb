class ChangeColumnDefaultToCloths < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:cloths, :rented, false)
  end
end
