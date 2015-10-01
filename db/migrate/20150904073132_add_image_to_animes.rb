class AddImageToAnimes < ActiveRecord::Migration
  def change
    add_column :animes, :image, :string
  end
end
