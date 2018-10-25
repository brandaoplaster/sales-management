class Client < ApplicationRecord
  enum status: [:active, :inactive]
  has_one    :addresses
  belongs_to :user
end
