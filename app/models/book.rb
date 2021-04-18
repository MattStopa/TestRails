class Book < ApplicationRecord
  validates :author, length: { minimum: 6 }
end
