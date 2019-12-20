class Discount < ApplicationRecord
    has_many :sales
    enum status: [:active, :inactive]
end
