class Company < ApplicationRecord
    has_one_attached :logo

    validates :name, presence: true, length: {minimum: 5}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
    validates :website, presence: true
end
