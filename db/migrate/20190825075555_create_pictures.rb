class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :image, null: false
      t.timestamps
    end
  end
end
