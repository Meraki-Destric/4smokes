json.extract! game, :id, :title, :description, :creator_id, :created_at, :updated_at
json.url game_url(game, format: :json)
