class Tag < ApplicationRecord
    has_many :appointments
    has_many :books, through: :appointments

    has_many :tag_fact_glues
    has_many :tag_glues

    has_many :foods, through: :tag_glues
    has_many :facts, through: :tag_fact_glues

    validates :tag_type, inclusion: %w[tag vitamin mineral]


end
