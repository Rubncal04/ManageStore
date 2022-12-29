# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  order_type       :string           not null
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
require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is valid with a product id" do
    product = Product.new(code: "34rty")
    expect(product.orders.new(quantity: 10, order_type: "purchase")).to be_valid
  end

  it "is not valid without a product id" do
    order = Order.new(quantity: 10, order_type: "purchase")
    expect { order.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it "is not valid without quantity" do
    product = Product.new(code: "34rty")
    order = product.orders.new(order_type: "sale")
    expect { order.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it "shouldn't have another order type value" do
    product = Product.new(code: "34rty")
    expect { product.orders.new(quantity: 10, order_type: "something") }.to raise_error ArgumentError
  end

  it "should have an order type value: 'purchase' or 'sale'" do
    product = Product.new(code: "34rty")
    order = product.orders.new(quantity: 10)
    expect { order.save! }.to raise_error ActiveRecord::RecordInvalid
  end
end
