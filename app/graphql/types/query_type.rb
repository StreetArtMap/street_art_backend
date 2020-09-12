module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    #users
    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    #street art
    field :street_arts, [Types::StreetArtType], null: false

    def street_arts
      StreetArt.all
    end

    #routes
    field :tours, [Types::TourType], null: true

    def tours
    end
  end
end
