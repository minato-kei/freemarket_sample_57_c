class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :purchase_user_id
      t.datetime :deal_at
      t.string :cancel
      t.string :item_status

      t.timestamps
    end
  end
end
