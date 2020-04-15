class UsersController < ApplicationController
  has_many :reviews
  has_many :orders
  has_many :milk, through: :reviews
end
