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
class Product < ApplicationRecord
    validates :code, presence: true, uniqueness: true
end
