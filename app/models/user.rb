class User < ApplicationRecord
  has_secure_password
  ROLES = %w[user admin seller].freeze
  validates :role, inclusion: { in: ROLES }

  has_one :shop

  has_many :shop_followers, foreign_key: :user_id
  has_many :followed_shops, through: :shop_followers, source: :shop

  def self.authenticate(email, password)
    user = find_by(email: email)
    return user if user&.authenticate(password)
  end

  # Other associations and validations

  def admin?
    role == 'admin'
  end

  def seller?
    role == 'seller'
  end
end

# {
#     "email": "admin@example.com",
#     "password": "admin123"
# }