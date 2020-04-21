class Review < ApplicationRecord
  belongs_to :milk

  validates :milk_id, :stars, :title, :content, :presence => true

end
