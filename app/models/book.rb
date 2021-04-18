class Book < ApplicationRecord
  has_many :appointments
  has_many :tags, through: :appointments
  validates :author, length: { minimum: 6 }
end