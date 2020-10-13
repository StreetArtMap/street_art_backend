require 'rails_helper'
require 'graphql'

RSpec.describe "user requests", type: :request do

  before(:each) do
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

  def new_user_query
    <<~GQL
      mutation {
        createUser ( input: {
          username: "HankHill"
          passwordDigest: "AlamoB33r"
          email: "ProPAIN@aol.com"
          })
          {
            id
            username
          }
      }
    GQL
  end
end
