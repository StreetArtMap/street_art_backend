module Types
  class FavoriteType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :street_art_id, Integer, null: false
  end
end
