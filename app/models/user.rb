class User < ApplicationRecord
  has_secure_password :password

  validates :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :posts
end
