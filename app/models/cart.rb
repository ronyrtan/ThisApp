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

  def add_item(item_id)
      line_item = line_items.where('item_id = ?', item_id).first
    if line_item
      line_item.quantity += 1
      # raise params
      line_item.save
    else
      self.line_items << LineItem.new(item_id: item_id, quantity: 1)
    end
    save
  end
end
