class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :condition,:condition_id
    rename_column :items, :status, :status_id
    rename_column :items, :size, :size_id
    rename_column :items, :cost_burden, :cost_burden_id
    rename_column :items, :shipping_day, :shipping_day_id
  end
end
