require 'rails_helper'
require 'graphql'

RSpec.describe "art requests", type: :request do

  before(:all) do
    @user = FactoryBot.create(:user)
    2.times do
      FactoryBot.create(:street_art, user: @user)
    end
    @street_art = @user.street_arts[0]
  end

  after(:context) do
    StreetArt.delete_all
    User.delete_all
  end

  it "returns all StreetArt" do
    post "/graphql", params: {query: "{streetArts {id, latitude, longitude, address,
                              city, state, zipcode, imageUrls, description, artistName,
                              artName, instagramHandle, favorite, visited, createdAt,
                              updatedAt, userId}}", operationName: nil, context: nil}

    response = JSON.parse(@response.body, symbolize_names: true)

    art_in_db = StreetArt.all
    art_returned = response[:data][:streetArts]
    art1 = art_returned[0]
    art2 = art_returned[1]

    expect(art1[:id].to_i).to eq(art_in_db[0][:id])
    expect(art2[:id].to_i).to eq(art_in_db[1][:id])

    expect(art1[:city]).to eq(art_in_db[0][:city])
    expect(art2[:city]).to eq(art_in_db[1][:city])
  end

  it "add new street art post to database" do

    post "/graphql", params: { query: base_query(user_id: @user.id)}

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data][:createStreetArt][:id].to_i).to be_a(Integer)
  end

  it "add new street art post to database without optional fields" do

    post "/graphql", params: { query: sad_query(user_id: @user.id)}

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data][:createStreetArt][:id].to_i).to be_a(Integer)
  end

  it "add new street art post to database without coordinates" do

    post "/graphql", params: { query: location_query(user_id: @user.id)}

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data][:createStreetArt][:id].to_i).to be_a(Integer)
  end

  it "add new street art post to database without address" do

    post "/graphql", params: { query: location_query2(user_id: @user.id)}

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data][:createStreetArt][:id].to_i).to be_a(Integer)
  end

  it "favorites a street art post" do
    expect(@street_art.favorite).to eq(false)

    post "/graphql", params: { query: favorite_query(street_art_id: @street_art.id)}

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data][:favoriteStreetArt][:id].to_i).to eq(@street_art.id)
    expect(response[:data][:favoriteStreetArt][:favorite]).to eq(true)
  end

  it "visits a street art post" do
    expect(@street_art.visited).to eq(false)

    post "/graphql", params: { query: visit_query(street_art_id: @street_art.id)}

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data][:visitStreetArt][:id].to_i).to eq(@street_art.id)
    expect(response[:data][:visitStreetArt][:visited]).to eq(true)
  end

  def base_query(user_id:)
    <<~GQL
      mutation {
        createStreetArt( input: {
          userId: #{user_id}
          latitude: "39.7666"
          longitude: "104.9837"
          address: "1136 Easton Parkway"
          city: "Rockford"
          state: "IL"
          zipcode: "61108"
          description: "Home to an assorted array of animals"
          artistName: "Crazy cat lady"
          artName: "TheBUG"
          instagramHandle: "@DragonFly"
          imageUrls: "['url', 'url', 'url']"
        }) {
            id
            latitude
            city
            artName
            }
      }
    GQL
  end

  def sad_query(user_id:)
    <<~GQL
      mutation {
        createStreetArt( input: {
          userId: #{user_id}
          latitude: "39.7666"
          longitude: "104.9837"
          address: "1136 Easton Parkway"
          city: "Rockford"
          state: "IL"
          zipcode: "61108"
          imageUrls: "['url', 'url', 'url']"
        }) {
            id
            }
      }
    GQL
  end

  def location_query(user_id:)
    <<~GQL
      mutation {
        createStreetArt( input: {
          userId: #{user_id}
          address: "1136 Easton Parkway"
          city: "Rockford"
          state: "IL"
          zipcode: "61108"
          imageUrls: "['url', 'url', 'url']"
        }) {
            id
            }
      }
    GQL
  end

  def location_query2(user_id:)
    <<~GQL
      mutation {
        createStreetArt( input: {
          userId: #{user_id}
          latitude: "42.255653"
          longitude: "-89.019156"
          imageUrls: "['url', 'url', 'url']"
        }) {
            id
            }
      }
    GQL
  end

  def favorite_query(street_art_id:)
    <<~GQL
      mutation {
        favoriteStreetArt( input: {
          streetArtId: #{street_art_id}
          favorite: true
        }) {
            id
            favorite
            }
      }
    GQL
  end

  def visit_query(street_art_id:)
    <<~GQL
      mutation {
        visitStreetArt( input: {
          streetArtId: #{street_art_id}
          visited: true
        }) {
            id
            visited
            }
      }
    GQL
  end
end
