# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  shipped      :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  stripe_token :string
#

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  def total(line_items)
    sum = 0
    line_items.each do |l|
      sum += (l.item.price * l.quantity)
    end
    sum
  end
end
