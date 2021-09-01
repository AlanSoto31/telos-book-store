class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.earnings(sales, app_revenue)
    earnings = 0
    app_fee = 0
    sales.each do |book|
      earnings += book.price
      app_fee += app_revenue
    end
    { earnings: earnings, app_fee: app_fee }
  end
end
