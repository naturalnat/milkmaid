class Order < ApplicationRecord
  belongs_to :user
  has_many :milks

  validates :name, :frequency, :size, :milk_id, :presence => true
 
end
