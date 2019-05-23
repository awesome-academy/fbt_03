class Category < ApplicationRecord
  has_many :tour_details, dependent: :destroy
  has_many :tours, dependent: :destroy
  scope :order_create, ->{order :created_at}
end
