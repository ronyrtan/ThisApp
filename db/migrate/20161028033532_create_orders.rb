class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :line_item_id
      t.boolean :shipped

      t.timestamps null: false
    end
  end
end
