class Tour < ApplicationRecord
  belongs_to :tour_detail
  belongs_to :category
  has_many :booking_requests, dependent: :destroy
  validates :tour_detail_id, presence: true
  delegate :name, :duration, to: :tour_detail
end
