class User < ApplicationRecord
    has_secure_password
    ROLES = %w[user admin].freeze
    validates :role, inclusion: { in: ROLES }
end
