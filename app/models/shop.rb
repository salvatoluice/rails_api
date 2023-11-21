class Shop < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :shop_followers
  has_many :followers, class_name: 'User', through: :shop_followers

  validates :name, :title, :category, presence: true

  # Assuming you're using Active Storage for image handling
  has_one_attached :image

  scope :seller_shops, -> { joins(:user).where(users: { role: 'seller' }) }
end
