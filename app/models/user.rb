class User < ApplicationRecord
  has_secure_password
  has_many :books
  has_one :cart
  validates :name, presence: true, length: { in: 2..15 }
  validates :email, uniqueness: true, presence: true
  #validates :password, length: { in: 6..30 }
end
