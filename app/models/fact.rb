class Fact < ApplicationRecord
  has_many :food_facts
  has_many :tag_fact_glues

  has_many :foods, through: :food_facts
  has_many :tags, through: :tag_fact_glues
end
