class User < ApplicationRecord
  has_many :booking_requests, :comments, dependent: :destroy
  has_many :reviews, through: :comments, dependent: :destroy
  enum role: {user: 0, admin: 1}
end
