class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :image_url
      t.text :description
      t.integer :latitude
      t.integer :longitude
      t.integer :user_id

      t.timestamps
    end
  end
end
