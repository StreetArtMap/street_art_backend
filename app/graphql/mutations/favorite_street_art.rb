class Mutations::FavoriteStreetArt < Mutations::BaseMutation
  argument :favorite, Boolean, required: true
  argument :street_art_id, Integer, required: true

  type Types::StreetArtType

  def resolve(favorite: ,street_art_id:)
    art = StreetArt.find(street_art_id)
    art.update(favorite: favorite)
    art.reload
  end
end
