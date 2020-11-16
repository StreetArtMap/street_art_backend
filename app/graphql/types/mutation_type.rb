module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_street_art, mutation: Mutations::CreateStreetArt
    field :favorite_street_art, mutation: Mutations::FavoriteStreetArt
    field :visit_street_art, mutation: Mutations::VisitStreetArt
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SignInUser
  end
end
