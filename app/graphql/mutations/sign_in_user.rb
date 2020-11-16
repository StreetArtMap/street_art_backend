class Mutations::SignInUser < Mutations::BaseMutation
  null true

  argument :credentials, Types::AuthProviderCredentialsInput, required: false

  field :token, String, null: true
  field :user, Types::UserType, null: true

  def resolve(credentials: nil)
    return unless credentials

    user = User.find_by email: credentials[:email]

    return unless user
    return unless user.authenticate(credentials[:password])

    token = "Sup3RS3creTT0K3N"

    {user: user, token: token}
  end
end
