class ChangeIntegerCondition < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :condition,:integer, null: false
    change_column :items, :status, :integer, default: 1, null: false
    change_column :items, :size, :integer
  end
end
