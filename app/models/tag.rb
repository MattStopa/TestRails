class Tag < ApplicationRecord
    has_many :appointments
    has_many :books, through: :appointments

    validates :tag_type, inclusion: %w[tag vitamin mineral]
end
