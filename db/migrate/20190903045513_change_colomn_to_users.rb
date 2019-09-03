class ChangeColomnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone_number, :string
    change_column :shippings, :phone, :string

  end
end
