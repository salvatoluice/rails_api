class Product < ApplicationRecord
  belongs_to :shop

  validates :title, :description, :price, :expiry_date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
end
