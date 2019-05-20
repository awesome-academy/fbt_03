class Tour < ApplicationRecord
  belongs_to :tour_detail
  has_many :booking_requests, dependent: :destroy
  validates :tour_detail_id, presence: true
end
