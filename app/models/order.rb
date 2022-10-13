# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  order_type       :string
#  product_quantity :integer
#  quantity         :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_id       :bigint           not null
#
# Indexes
#
#  index_orders_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class Order < ApplicationRecord
  belongs_to :product

  enum :order_type, { purchase: 'purchase', sale: 'sale' }

  validates :quantity, presence: true

  before_save :set_product_quantity
  after_save :set_quantity

  private

  def set_product_quantity
    self.product_quantity = product.stock_quantity
  end

  def set_quantity
    if purchase?
      product.increment!(:stock_quantity, quantity)
   elsif sale?
      product.decrement!(:stock_quantity, quantity)
    end
  end
end
