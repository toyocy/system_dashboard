json.extract! server, :id, :hostname, :url, :description, :system_id, :created_at, :updated_at
json.url server_url(server, format: :json)
