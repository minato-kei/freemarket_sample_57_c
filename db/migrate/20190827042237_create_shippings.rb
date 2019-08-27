class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer     :zipcode, null: false
      t.string      :pref, null: false
      t.string      :city, null: false
      t.string      :address, null: false
      t.string      :building
      t.integer     :phone
      t.boolean     :default, default: false
      t.timestamps
    end
    # add_reference :shippings, :item, foreign_key: true, null: false
    add_reference :shippings, :user, foreign_key: true, null: false
  end
end
