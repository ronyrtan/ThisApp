class CreateItemsWishlists < ActiveRecord::Migration
  def change
    create_table :items_wishlists do |t|
      t.integer :wishlist_id
      t.integer :item_id
    end
  end
end
