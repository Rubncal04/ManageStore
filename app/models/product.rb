class Product < ApplicationRecord
    validates :code, presence: true, uniqueness: true
end
