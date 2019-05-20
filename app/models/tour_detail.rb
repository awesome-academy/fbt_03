class TourDetail < ApplicationRecord
  belongs_to :category
  has_many :images, :reviews, :tours, dependent: :destroy
  validates :category_id, presence: true
end
