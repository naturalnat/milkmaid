class Milk < ApplicationRecord
  # belongs_to :order
  # belongs_to :user
  has_many :reviews
  has_many :orders
end
