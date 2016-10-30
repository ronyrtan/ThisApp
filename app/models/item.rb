# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :float
#  description :text
#  colour      :string
#  size        :string
#  brand       :string
#  category    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Item < ActiveRecord::Base
  has_one :line_item

  def find_by_category(item)
    Item.where(:category => item)
  end
end
