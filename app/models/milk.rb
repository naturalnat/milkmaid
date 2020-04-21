# frozen_string_literal: true

class Milk < ApplicationRecord
  has_many :reviews, through: :milk
  has_many :orders, through: :user
end
