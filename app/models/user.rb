# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  dob             :date
#  email           :string
#  address         :text
#  billing_details :text
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_one :cart
end
