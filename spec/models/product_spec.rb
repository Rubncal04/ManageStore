# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  code        :string           not null
#  name        :string
#  description :text
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with a code" do
    expect(Product.new(code: "34rty")).to be_valid
  end

  it "is not valid without a code" do
    expect(Product.new(code: nil)).to_not be_valid
  end

  it "is valid if there are different codes" do
    product = Product.new(code: "geu22")
    product2 = Product.new(code: "geu2")
    expect(product != product2).to be_truthy
  end

  it "is not valid if are the same code" do
    product = Product.new(code: "geu22")
    product2 = Product.new(code: "geu22")
    expect(product == product2).to be false
  end
end
