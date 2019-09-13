class ChangeShipping < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :shipping_day_id,:integer, null: false
  end
end
