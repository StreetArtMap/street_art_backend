module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_street_art, mutation: Mutations::CreateStreetArt
  end
end
