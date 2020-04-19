class User < ApplicationRecord
  has_many :reviews
  has_many :orders

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  has_secure_password

def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.email = auth["email"]
    user.username = auth["username"]
    user.password_digest = SecureRandom.uuid
  end

  end
end
