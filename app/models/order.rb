# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :milks

  validates :name, :frequency, :size, :milk_id, presence: true

  scope :longest_name, -> { order("COUNT(LENGTH(name)) desc").limit(1)} 

end
