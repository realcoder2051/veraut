json.extract! document, :id, :name, :type, :description, :user_id, :created_at, :updated_at
json.url document_url(document, format: :json)
