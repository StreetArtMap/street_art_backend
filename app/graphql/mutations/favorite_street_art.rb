class Mutations::FavoriteStreetArt < Mutations::BaseMutation
  argument :user_id, Integer, required: true
  argument :street_art_id, Integer, required: true

  type Types::FavoriteType

  def resolve(user_id:, street_art_id:)
    Favorite.create(user_id: user_id, street_art_id: street_art_id)
  end
end
