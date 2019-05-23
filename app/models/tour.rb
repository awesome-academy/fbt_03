class Tour < ApplicationRecord
  belongs_to :tour_detail
  has_many :booking_requests, dependent: :destroy
  validates :tour_detail_id, presence: true

  def quantity? number
    self[:quantity] >= number
  end

  def tour_quantity
    number = self.booking_requests.reverse.first[:quantity]
    update_attribute(:quantity, self[:quantity] - number)
  end
end
