class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :episodes
      t.integer :company_id
      t.string :slug

      t.timestamps
    end
  end
end
