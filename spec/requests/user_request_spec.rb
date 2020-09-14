require 'rails_helper'
require 'graphql'

RSpec.describe "art requests", type: :request do

  before(:all) do
    @user = FactoryBot.create(:user)
  end

  after(:context) do
    User.delete_all
  end

  it "returns all StreetArt" do
    post "/graphql", params: {query: "{users {id, username }}", operationName: nil, context: nil}

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data]).to be_a(Hash)
    expect(response[:data][:users][0][:id].to_i).to be_a(Integer)
  end
end
