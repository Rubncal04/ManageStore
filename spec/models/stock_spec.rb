require 'rails_helper'

RSpec.describe Stock, type: :model do
  it "can't be saved without a product" do
    stock = Stock.new
    stock.product = nil
    expect { stock.save!(validate: false) }.to raise_error ActiveRecord::NotNullViolation
  end

  it "is valid with product" do
    product = Product.create(name: "Cheese", code: "123ght")
    expect(Stock.new(quantity: 2, product_id: product.id)).to be_valid
  end

  it "is valid with differents product id" do
    product1 = Product.create(name: "Cheese", code: "123ght")
    product2 = Product.create(name: "Cheese", code: "12ght")
    stock1 = Stock.new(quantity: 2, product_id: product1.id)
    stock2 = Stock.new(quantity: 3, product_id: product2.id)
    expect(stock1 != stock2).to be_truthy
  end

  it "is not valid with product id equals" do
    product = Product.create(name: "Cheese", code: "123ght")
    stock1 = Stock.new(quantity: 2, product_id: product.id)
    stock2 = Stock.new(quantity: 3, product_id: product.id)
    expect(stock1 == stock2).to be_falsey
  end
end
