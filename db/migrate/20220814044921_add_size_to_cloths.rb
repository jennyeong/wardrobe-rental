class AddSizeToCloths < ActiveRecord::Migration[7.0]
  def change
    add_column :cloths, :size, :string
  end
end
