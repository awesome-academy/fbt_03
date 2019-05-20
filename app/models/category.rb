class Category < ApplicationRecord
  has_many :tour_details, dependent: :destroy
end
