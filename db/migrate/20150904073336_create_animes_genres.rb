class CreateAnimesGenres < ActiveRecord::Migration
  def change
    create_table :animes_genres, :id => false do |t|
      t.references :anime
      t.references :genre
    end
    add_index :animes_genres, [:anime_id, :genre_id]
    add_index :animes_genres, :genre_id
  end
end
