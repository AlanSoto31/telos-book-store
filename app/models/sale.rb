class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.earnings(sales)
    app_revenue = 1
    acc = 0
    sales.each do |book|
      acc += book.price
    end
    acc - app_revenue
  end
end
