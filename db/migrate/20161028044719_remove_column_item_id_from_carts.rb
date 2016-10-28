class RemoveColumnItemIdFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :item_id
  end
end
