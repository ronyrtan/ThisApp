class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :item_id
      t.float :total

      t.timestamps null: false
    end
  end
end
