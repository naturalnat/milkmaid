class User < ApplicationRecord
  has_many :reviews
  has_many :orders #created
  has_many :reviewed_milk, through: :reviews

  validates :username, uniqueness: true, presence: true

  has_secure_password

end
