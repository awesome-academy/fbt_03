class Image < ApplicationRecord
  belongs_to :tour_detail
  validates :tour_detail_id, presence: true
end
