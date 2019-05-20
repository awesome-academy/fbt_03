class Review < ApplicationRecord
  belongs_to :user, :tour_detail
  validates :user_id, presence: true
  validates :tour_detail_id, presence: true
end
