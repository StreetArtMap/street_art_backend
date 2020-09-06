class Mutations::CreateStreetArt < Mutations::BaseMutation
  argument :latitude, String, required: true
  argument :longitude, String, required: true
  argument :address, String, required: true
  argument :city, String, required: true
  argument :state, String, required: true
  argument :zipcode, String, required: true
  # argument :image_urls, String, required: true
  argument :description, String, required: false
  argument :artist_name, String, required: false
  argument :art_name, String, required: false
  argument :instagram_handle, String, required: false
  argument :favorite, Boolean, required: true
  argument :visited, Boolean, required: true
  argument :user_id, Integer, required: true

  field :street_art, Types::StreetArtType, null:false

  #need to add image_urls back in
  def resolve(latitude:, longitude:, address:, city:, state:, zipcode:, description:, artist_name:, art_name:, favorite:, visited:, user_id:)
    x = StreetArt.new(latitude: latitude, longitude: longitude, address: address, city: city, state: state, zipcode: zipcode, description: description, artist_name: artist_name, art_name: art_name, favorite: favorite, visited: visited, user_id: user_id)
  end
end
