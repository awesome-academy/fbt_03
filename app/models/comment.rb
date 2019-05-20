class Comment < ApplicationRecord
  belongs_to :review, :user
  validates :review_id, presence: true
  validates :user_id, presence: true
end
