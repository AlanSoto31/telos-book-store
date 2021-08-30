class Book < ApplicationRecord
  belongs_to :user
  has_many :cart_books, dependent: :delete_all
  has_many :carts, through: :cart_books
  has_many :sales, dependent: :delete_all
  has_many :users, through: :sales

  validates :title, uniqueness: true, presence: true, length: { in: 2..30 }
  validates :description, presence: true, length: { in: 5..200 }
  validates :author, presence: true, length: { in: 2..30 }
  validates :price, presence: true, length: { in: 1..8 }

  def self.search(search)
    Book.find_by(title: search) ? Book.where(title: search, available: true) : Book.all.where(available: true)
  end
end
