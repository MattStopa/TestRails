json.extract! food, :id, :published, :description, :name, :image_url, :slug, :created_at, :updated_at
json.url food_url(food, format: :json)
