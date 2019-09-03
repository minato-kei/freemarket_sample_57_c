class AddItemIdToPicture < ActiveRecord::Migration[5.2]
  def change
    add_reference :pictures, :item, foreign_key: true, null: false
  end
end
