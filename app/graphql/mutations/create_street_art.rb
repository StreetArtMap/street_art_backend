class Mutations::CreateStreetArt < Mutations::BaseMutation
  argument :latitude, String, required: true
  argument :longitude, String, required: true
  argument :address, String, required: true
  argument :city, String, required: true
  argument :state, String, required: true
  argument :zipcode, String, required: true
  argument :image_urls, String, required: true
  argument :description, String, required: false
  argument :artist_name, String, required: false
  argument :art_name, String, required: false
  argument :instagram_handle, String, required: false
  argument :favorite, Boolean, required: false
  argument :visited, Boolean, required: false
  argument :user_id, Integer, required: true

  type Types::StreetArtType

  def resolve(latitude:, longitude:, address:, city:, state:, zipcode:, image_urls:, description: nil, artist_name: nil, art_name: nil, instagram_handle: nil, favorite: false, visited: false, user_id:)
    User.find(user_id).street_arts.create!(latitude: latitude, longitude: longitude, address: address, city: city, state: state, zipcode: zipcode, image_urls: image_urls, description: description, artist_name: artist_name, art_name: art_name, instagram_handle: instagram_handle, favorite: favorite, visited: visited)
  end
end
