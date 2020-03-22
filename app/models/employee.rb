class Employee < ApplicationRecord
  belongs_to :company

  validates :firstname, presence: true, length: {minimum: 3}
  validates :lastname, presence: true, length: {minimum: 3}
  validates :phone, presence: true, numericality: true
end