class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :file
      t.references :anime

      t.timestamps
    end
  end
end
