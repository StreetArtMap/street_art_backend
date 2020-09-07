require 'rails_helper'
require 'graphql'

RSpec.describe "art requests", type: :request do

  before(:all) do
    @user = User.create(username: "Hank Hill", email: "ProPAIN@aol.com")
    @art_post = @user.street_arts.create(latitude: "39.7666", longitude: "104.9837", address: "RiNo", city: "Denver", state: "CO", zipcode: "80216", image_urls: ["https://cdn.5280.com/2017/04/RiNo-neighborhood-street-art.jpg"], description: "neat-o!", artist_name: "Larry", art_name: "cool-art-1", favorite: true, visited: true)
    @user.street_arts.create(latitude: "39.7527", longitude: "105.0017", address: "LoDo", city: "Denver", state: "CO", zipcode: "80202", image_urls: ["https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTW8zd6DEZ5UHfY8r8NJB-jEcpGAlbHlwg6Cg&usqp=CAU"], description: "neat-o!", artist_name: "Larry",  art_name: "cool-art-2", instagram_handle: "@insta", favorite: false, visited: true)
    @user.street_arts.create(latitude: "39.7581", longitude: "104.9874", address: "Five Points", city: "Denver", state: "CO", zipcode: "80216", image_urls: ["https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRe-qGNr3_dvdgNqE6g81qa4OTlSvmfbiGCRw&usqp=CAU"], description: "neat-o!", artist_name: "Larry", instagram_handle: "@insta", favorite: true, visited: true)
  end

  after(:context) do
    StreetArt.delete_all
    User.delete_all
  end

  it "returns all StreetArt" do
    post "/graphql", params: {query: "{streetArts {id, latitude, longitude, address, city, state, zipcode, imageUrls, description, artistName, artName, instagramHandle, favorite, visited, createdAt, updatedAt, userId}}", operationName: nil, context: nil}

    response = JSON.parse(@response.body, symbolize_names: true)
    all_arts = response[:data][:streetArts]
    art = all_arts[0]

    expect(all_arts.count).to eq(3)

    expect(art[:id].to_i).to eq(@art_post[:id])
    expect(art[:longitude]).to eq(@art_post[:longitude])
    expect(art[:latitude]).to eq(@art_post[:latitude])
    expect(art[:address]).to eq(@art_post[:address])
    expect(art[:city]).to eq(@art_post[:city])
    expect(art[:state]).to eq(@art_post[:state])
    expect(art[:zipcode]).to eq(@art_post[:zipcode])
    expect(art[:imageUrls]).to eq(@art_post[:image_urls])
    expect(art[:description]).to eq(@art_post[:description])
    expect(art[:artistName]).to eq(@art_post[:artist_name])
    expect(art[:artName]).to eq(@art_post[:art_name])
    expect(art[:instagramHandle]).to eq(@art_post[:instagram_handle])
    expect(art[:favorite]).to eq(@art_post[:favorite])
    expect(art[:visited]).to eq(@art_post[:visited])
    expect(art[:createdAt][0..9]).to eq(@art_post[:created_at].to_s[0..9])
    expect(art[:updatedAt][0..9]).to eq(@art_post[:updated_at].to_s[0..9])
    expect(art[:userId]).to eq(@art_post[:user_id])
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

    post "/graphql", params: { query: location2_query(user_id: @user.id)}

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data][:createStreetArt][:id].to_i).to be_a(Integer)
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
          description: "bkah ablh"
          artistName: "sddf"
          artName: "dasf"
          instagramHandle: "sfdfsfd"
          imageUrls: "['url', 'url', 'url']"
        }) {
            id
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

  def location2_query(user_id:)
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
end
