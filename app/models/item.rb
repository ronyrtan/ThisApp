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
#

class Item < ActiveRecord::Base
  has_one :line_item
end
