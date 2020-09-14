require 'rails_helper'
require 'graphql'

RSpec.describe "tour requests", type: :request do

  before(:all) do
    user = FactoryBot.create(:user)
    user.street_arts.create!({
      latitude: '39.739773',
      longitude: '-104.960385',
      address: '2220 East Colfax Ave',
      city: 'Denver',
      state: 'CO',
      zipcode: '80206',
      image_urls: "['/public/hands.png', '/public/hand.png']",
      description:'Honoring missed connections',
      artist_name: 'Lauren Napolitano',
      instagram_handle: 'peptalks'
      })

    user.street_arts.create!({
      latitude: '39.736899',
      longitude: '-104.947954',
      address: '1300 Adams Street',
      city: 'Denver',
      state: 'CO',
      zipcode: '80206',
      image_urls: "['/public/helen.png', '/public/helen2.png', '/public/helen3.png']",
      description:'With this building I wanted to create a chronological Greek narrative. The piece starts with an egg hatching, hinting at the myth of Leda and the Swan. The mural ends with an image of Helen of Troy and her sister.',
      art_name: 'The birth of Helen and Clytemnestra',
      artist_name: 'Nick Napoletano',
      instagram_handle: 'napoletanoart'
      })

    user.street_arts.create!({
      latitude: '39.758005',
      longitude: '-104.985765',
      address: '2532 Larimer Street',
      city: 'Denver',
      state: 'CO',
      zipcode: '80205',
      image_urls: "['/public/botanicare.png']",
      description:'Her with plants'
      })

    user.street_arts.create!({
      latitude: '39.765144',
      longitude: '-104.979897',
      address: '3196 Blake Street',
      city: 'Denver',
      state: 'CO',
      zipcode: '80205',
      image_urls: "['/public/pichi_and_avo.png']",
      description: 'Hermes mural',
      artist_name: 'PichiAvo',
      instagram_handle: 'pichiavo'
      })

    user.street_arts.create!({
      latitude: '39.763562',
      longitude: '-104.978627',
      address: '3128 Larimer Street',
      city: 'Denver',
      state: 'CO',
      zipcode: '80205',
      image_urls: "['/public/snake.png']",
      description: 'Snake and moon',
      artist_name: 'Lauren Napolitano',
      instagram_handle: 'peptalks'
      })

    user.street_arts.create!({
      latitude: '39.759987',
      longitude: '-104.986479',
      address: '2632 Blake Street',
      city: 'Denver',
      state: 'CO',
      zipcode: '80205',
      image_urls: "['/public/wolflady.png']",
      description: 'Wolf lady mural'
      })

    user.street_arts.create!({
      latitude: '39.754832',
      longitude: '-104.987198',
      address: '2314 Broadway',
      city: 'Denver',
      state: 'CO',
      zipcode: '80205',
      image_urls: "['/public/denver_heart.png']",
      description: 'Geometric heart mural',
      artist_name: 'Pat Milbery',
      instagram_handle: 'patmilbery'
      })
  end

  after(:context) do
    StreetArt.delete_all
    User.delete_all
  end

  it "returns all tours" do
    get "/tours"

    response = JSON.parse(@response.body, symbolize_names: true)

    expect(response[:data]).to be_a(Hash)
    expect(response[:data][:allTours]).to be_a(Array)
  end
end
