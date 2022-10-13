# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  code           :string           not null
#  description    :text
#  name           :string
#  price          :float
#  stock_quantity :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_products_on_code  (code) UNIQUE
#
class Product < ApplicationRecord
    has_many :orders

    validates :code, presence: true, uniqueness: true
end
