class CreateStreetArt < ActiveRecord::Migration[5.1]
  def change
    create_table :street_arts do |t|
      t.string :latitude
      t.string :longitude
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :image_urls
      t.string :description
      t.string :artist_name
      t.string :art_name
      t.string :instagram_handle
      t.boolean :favorite, default: false
      t.boolean :visited, default: false
      t.timestamps
    end
  end
end
