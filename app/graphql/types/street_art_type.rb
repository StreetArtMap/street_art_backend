module Types
  class StreetArtType < Types::BaseObject
    field :id, ID, null: false
    field :latitude, String, null: true
    field :longitude, String, null: true
    field :address, String, null: true
    field :city, String, null: true
    field :state, String, null: true
    field :zipcode, String, null: true
    field :image_urls, String, null: true
    field :description, String, null: true
    field :artist_name, String, null: true
    field :art_name, String, null: true
    field :instagram_handle, String, null: true
    field :favorite, Boolean, null: true
    field :visited, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: true
  end
end
