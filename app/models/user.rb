class User < ApplicationRecord
  has_many :reviews
  has_many :orders

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  has_secure_password

end
