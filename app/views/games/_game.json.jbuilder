json.extract! game, :id, :image, :name, :description, :date-released, :rating, :price, :created_at, :updated_at
json.url game_url(game, format: :json)
