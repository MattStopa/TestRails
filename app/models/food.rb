class Food < ApplicationRecord
  has_many :food_facts
  has_many :facts, through: :food_facts

  has_many :tag_glues
  has_many :tags, through: :tag_glues
end
