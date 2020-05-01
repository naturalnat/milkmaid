# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reviews
  has_many :orders

  validates :email, uniqueness: true, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  has_secure_password

  scope :most_reviews, -> { select("users.id, COUNT(reviews.user_id) AS reviews_count")
      .joins(:reviews)
      .group(:id)
      .order(reviews_count: :desc)
  }

  def self.create_by_github_omniauth(auth)
    find_or_create_by(email: auth[:info][:email]) do |user|
      user.password_digest = SecureRandom.uuid
    end
  end

end
