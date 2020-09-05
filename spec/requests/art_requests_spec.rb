require 'rails_helper'
require 'graphql'



RSpec.describe "art requests", type: :request do

  it "returns all StreetArt" do
    user = User.create(username: "Hank Hill", email: "ProPAIN@aol.com")
    user.street_arts.create(latitude: "39.742043", longitude: "-104.991531", address: "123 fakeplace", city: "Denver", state: "CO", zipcode: "80128", image_urls: ["https://images.freeimages.com/images/large-previews/5b5/bristles-1173194.jpg"], description: "neat-o!", artist_name: "Larry", favorite: true, visited: true)

    post "/graphql", params: {"query" => "{streetArts {id, latitude, longitude}"}

    # post "/graphql", params: { "query" => "{ streetArts {id}}"} 

    response = JSON.parse(response)
    require "pry";binding.pry
  end
end
