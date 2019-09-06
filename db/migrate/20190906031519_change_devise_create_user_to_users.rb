class ChangeDeviseCreateUserToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :last_name_kanji,:string, null:true
    change_column :users, :first_name_kanji, :string, null:true
    change_column :users, :last_name_kana, :string, null:true
    change_column :users, :first_name_kana, :string, null:true
    change_column :users, :birthday, :integer, null:true
    change_column :users, :phone_number, :integer, null:true
  end

  def down
    change_column :users, :last_name_kanji, :string, null:false
    change_column :users, :first_name_kanji, :string, null:false
    change_column :users, :last_name_kana, :string, null:false
    change_column :users, :first_name_kana, :string, null:false
    change_column :users, :birthday, :integer, null:false
    change_column :users, :phone_number, :integer, null:false
  end
end
