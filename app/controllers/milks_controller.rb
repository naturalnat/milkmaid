class MilksController < ApplicationController
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed
end
