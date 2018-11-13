json.extract! user, :id, :password, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
