class AddTextToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :text,:text, null:true
  end
end
