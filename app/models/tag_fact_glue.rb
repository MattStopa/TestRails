class TagFactGlue < ApplicationRecord
  belongs_to :fact
  belongs_to :tag
end
