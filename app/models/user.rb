class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum kind: [:salesman, :manager]
  enum status: [:active, :inactive]

  has_many :comissions
  has_many :addresses
  has_many :client
  has_many :product_quantity
  has_many :sales
end
