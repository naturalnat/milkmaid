class Order < ApplicationRecord
  belongs_to :user  #user made it
  has_many :milk #can order multiple
  # has_many :users, through: :milks #
  accepts_nested_attributes_for :milk

end
