class Employee < ApplicationRecord
  belongs_to :company

  validates :firstname, presence: true, length: {minimum: 1}
  validates :lastname, presence: true, length: {minimum: 1}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :company_id, presence: true
end