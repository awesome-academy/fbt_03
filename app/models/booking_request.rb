class BookingRequest < ApplicationRecord
  # belongs_to :user, :tour, :tour_detail
  validates :user_id, presence: true
  validates :tour_id, presence: true
  validates :name, presence: true,
    length: {maximum: Settings.length_name_maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:
    {maximum: Settings.length_email_maximum}, format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  VALID_PHONE_REGEX = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}
  validates :quantity, presence: true, {maximum: Settings.tour_quantity_maximum}
end
