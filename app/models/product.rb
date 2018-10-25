class Product < ApplicationRecord
    enum status: [:active, :inactive]
    has_many :product_quantity
end
