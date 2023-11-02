class User < ApplicationRecord
  has_secure_password
  has_many :wishes
  validates :email, presence: true
end
