json.array!(@animes) do |anime|
  json.extract! anime, :id, :title, :description, :episodes, :status, :start_aired, :end_aired, :producer_id, :duration, :user_id
  json.url anime_url(anime, format: :json)
end
