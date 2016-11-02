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
  has_and_belongs_to_many :wishlists

  def self.find_by_category(item)
    Item.where(:category => item)
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
