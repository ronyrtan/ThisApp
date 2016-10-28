class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :colour
      t.string :size
      t.string :brand
      t.string :category

      t.timestamps null: false
    end
  end
end
