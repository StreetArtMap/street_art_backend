class Mutations::VisitStreetArt < Mutations::BaseMutation
  argument :visited, Boolean, required: true
  argument :street_art_id, Integer, required: true

  type Types::StreetArtType

  def resolve(visited:, street_art_id:)
    art = StreetArt.find(street_art_id)
    art.update(visited: visited)
    art.reload
  end
end
