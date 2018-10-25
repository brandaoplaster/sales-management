class User < ApplicationRecord
    enum kind: [:salesman, :manager]
    enum status: [:active, :inactive]

    has_many :comissions
    has_many :addresses
    has_many :client
    has_many :product_quantity
    has_many :sales
end
