class Sale < ApplicationRecord
  has_many   :product_quantity
  belongs_to :client
  belongs_to :user
  belongs_to :discount
  has_one :comission
end
