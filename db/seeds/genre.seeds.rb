genres = ["Action", "Romance", "School", "Comedy", "Adventure", "Horror", "Slice of Life", "Game"]

genres.each do |genre|
  Genre.find_or_create_by({name: genre, description: genre})
end