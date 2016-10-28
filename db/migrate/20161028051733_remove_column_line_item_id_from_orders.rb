class RemoveColumnLineItemIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :line_item_id
  end
end
