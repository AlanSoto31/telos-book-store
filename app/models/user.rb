class User < ApplicationRecord
  has_secure_password
  has_many :sales, dependent: :delete_all
  has_many :books, through: :sales
  has_one :cart
  validates :name, presence: true, length: { in: 2..15 }
  validates :email, uniqueness: true, presence: true
end
