module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_street_art, mutation: Mutations::CreateStreetArt
    field :favorite_street_art, mutation: Mutations::FavoriteStreetArt
  end
end
