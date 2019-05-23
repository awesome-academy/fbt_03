class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tours
  has_many :reviews, through: :comments, dependent: :destroy
  enum role: {user: 0, admin: 1}

  validates :name, presence: true,
   length: {maximum: Settings.length_name_maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
   length: {maximum: Settings.length_email_maximum},
   format: {with: VALID_EMAIL_REGEX},
   uniqueness: {case_sensitive: false}
  validates :password, presence: true, allow_nil: true,
   length: {minimum: Settings.length_password_minimum}

  has_secure_password
end
