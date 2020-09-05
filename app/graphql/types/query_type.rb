module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    #users
    field :users, [Types::UserType], null: false

    def users
      User.all
    end
  end
end
