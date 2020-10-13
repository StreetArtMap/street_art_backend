class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: true
  argument :passwordDigest, String, required: true

  type Types::UserType

  def resolve( username: nil, email: nil, passwordDigest: nil)
    User.create(username: username, email: email, password_digest: passwordDigest)
  end
end
