class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      t.text :description
      t.string :episodes
      t.string :status
      t.date :start_aired
      t.date :end_aired
      t.integer :producer_id
      t.string :duration
      t.integer :user_id

      t.timestamps
    end
  end
end
