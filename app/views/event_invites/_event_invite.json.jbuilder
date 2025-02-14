json.extract! event_invite, :id, :event_id, :user_id, :created_at, :updated_at
json.url event_invite_url(event_invite, format: :json)
