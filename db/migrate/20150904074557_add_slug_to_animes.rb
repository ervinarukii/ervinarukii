class AddSlugToAnimes < ActiveRecord::Migration
  def change
    add_column :animes, :slug, :string
  end
end
