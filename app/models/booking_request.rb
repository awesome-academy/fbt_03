class BookingRequest < ApplicationRecord
  belongs_to :user, :tour, :tour_detail
  validates :user_id, presence: true
  validates :tour_id, presence: true
end
