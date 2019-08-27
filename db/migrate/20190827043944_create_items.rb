class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name, null: false
      t.integer     :price, null: false
      t.string      :size
      t.string      :condition, null: false
      t.integer     :cost_burden
      t.string      :shipping_from, null: false
      t.string      :shipping_day, null: false
      t.integer     :rating
      t.string      :status, null: false, default: "出品中"
      t.timestamps
    end
    add_index :items, :name
    add_reference :items, :user, foreign_key: true, null: false
    add_reference :items, :category, foreign_key: true, null: false
    add_reference :items, :shipping, foreign_key: true, null: false
  end
end