module Types
  class StreetArtType < Types::BaseObject
    field :id, ID, null: false
    field :latitude, String, null: false
    field :longitude, String, null: false
    field :address, String, null: false
    field :city, String, null: false
    field :state, String, null: false
    field :zipcode, String, null: false
    field :image_urls, String, null: false
    field :description, String, null: true
    field :artist_name, String, null: true
    field :art_name, String, null: true
    field :instagram_handle, String, null: true
    field :favorite, Boolean, null: false
    field :visited, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: false
  end
end
