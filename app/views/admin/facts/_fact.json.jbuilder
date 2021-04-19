json.extract! fact, :id, :published, :links, :headline, :summary, :created_at, :updated_at
json.url fact_url(fact, format: :json)
