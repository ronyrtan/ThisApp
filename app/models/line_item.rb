# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  cart_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#

class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  belongs_to :cart

  def self.total_per_item(price, quantity)
    price * quantity
  end

  def self.increment_quantity(quantity)
    quantity += 1
  end

end
