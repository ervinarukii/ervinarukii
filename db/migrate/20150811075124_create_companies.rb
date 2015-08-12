class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.string :email
      t.text :address
      t.string :telephone
      t.string :host
      t.integer :user_id

      t.timestamps
    end
  end
end
