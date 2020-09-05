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
      require "pry";binding.pry
      StreetArt.all
    end
  end
end
