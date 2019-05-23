class TourDetail < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tours, dependent: :destroy
  validates :category_id, presence: true
end
