require 'rails_helper'
require 'graphql'

RSpec.describe "user requests", type: :request do

  before(:context) do
    @user = FactoryBot.create(:user)
  end

  after(:context) do
    User.delete_all
  end

  it "returns all Users" do
    post "/graphql", params: {query: "{users {id, username }}", operationName: nil, context: nil}

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data]).to be_a(Hash)
    expect(response[:data][:users][0][:id].to_i).to eq(User.last.id)
  end

  it 'handles variables' do
    post '/graphql', params: { query: '{ users {id, username } }', variables: 1000 }

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data]).to be_a(Hash)
    expect(response[:data][:users][0][:id].to_i).to eq(User.last.id)
  end

  it 'handles variables' do
    post '/graphql', params: { query: '{ users {id, username } }', variables: { var: 1000 } }

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data]).to be_a(Hash)
    expect(response[:data][:users][0][:id].to_i).to eq(User.last.id)
  end

  it 'creates new user' do
    post '/graphql', params: { query: new_user_query}
    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data]).to be_a(Hash)
    expect(response[:data][:createUser][:id].to_i).to eq(User.last.id)
  end

  it "sign in user" do
    User.create(username: "FROG", email: "FrogStuff@aol.com", password: "Ribbit")
    post '/graphql', params: { query: sign_in_user }
    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data][:signinUser][:token]).to_not eq(nil)
  end

  def new_user_query
    <<~GQL
      mutation {
        createUser ( input: {
          username: "HankHill"
          authProvider: {
            credentials: {
              email: "ProPAIN@aol.com"
              password: "AlamoB33r"
            }
          }
          })
          {
            id
            username
          }
      }
    GQL
  end

  def sign_in_user
    <<~GQL
      mutation {
        signinUser ( input: {
            credentials: {
              email: "FrogStuff@aol.com"
              password: "Ribbit"
            }
          })
          {
              token
          }
      }
    GQL
  end
end
