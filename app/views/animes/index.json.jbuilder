json.array!(@animes) do |anime|
  json.extract! anime, :id, :title, :description, :image, :episodes, :company_id
  json.url anime_url(anime, format: :json)
end
