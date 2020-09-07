class Mutations::CreateStreetArt < Mutations::BaseMutation
  argument :latitude, String, required: false
  argument :longitude, String, required: false
  argument :address, String, required: false
  argument :city, String, required: false
  argument :state, String, required: false
  argument :zipcode, String, required: false
  argument :image_urls, String, required: true
  argument :description, String, required: false
  argument :artist_name, String, required: false
  argument :art_name, String, required: false
  argument :instagram_handle, String, required: false
  argument :favorite, Boolean, required: false
  argument :visited, Boolean, required: false
  argument :user_id, Integer, required: true

  type Types::StreetArtType

  def resolve(latitude: nil, longitude: nil, address: nil, city: nil, state: nil, zipcode: nil, image_urls:, description: nil, artist_name: nil, art_name: nil, instagram_handle: nil, favorite: false, visited: false, user_id:)
    User.find(user_id).street_arts.create!(latitude: latitude, longitude: longitude, address: address, city: city, state: state, zipcode: zipcode, image_urls: image_urls, description: description, artist_name: artist_name, art_name: art_name, instagram_handle: instagram_handle, favorite: favorite, visited: visited)
  end
end
