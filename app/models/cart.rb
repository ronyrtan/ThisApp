# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  total      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user

  # before_save :update_total

  def add_item(item_id, qty)
    line_item = line_items.where('item_id = ?', item_id).first
    if line_item
      line_item.quantity = qty
      line_item.save
    else
      self.line_items << LineItem.new(item_id: item_id, quantity: 1)
    end
    save
  end

  def total_price
    sum = 0
    line_items.each do |l|
      sum += (l.item.price * l.quantity)
    end
    sum
  end

  def update_total
    self[:total] = total
  end
end
