class Milk < ApplicationRecord
  has_many :reviews, through: :milk
  has_many :orders, through: :user
end
