require 'rails_helper'

describe 'TourUrl', type: :poro do
  it 'generates url string from coordinates' do
    coordinates = [["39.757300", "-104.986918"], ["39.758697", "-104.985510"], ["39.759241", "-104.985322"], ["39.760942", "-104.983589"]]

    url = TourUrl.new(coordinates).create_url

    expect(TourUrl.new(coordinates).coordinates).to eq(coordinates)
    expect(TourUrl.new(coordinates).origin).to eq('39.757300,-104.986918')
    expect(TourUrl.new(coordinates).center).to eq('@39.759121,-104.9852535,')
  end

  it 'arranges coordinates in a logical sequence' do
    user = FactoryBot.create(:user)
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

    tour = RinoTour.new

    expected =
    [["39.763562", "-104.978627"],
    ["39.765144", "-104.979897"],
    ["39.758005", "-104.985765"],
    ["39.759987", "-104.986479"]]

    expect(tour.rino_coordinates).to eq(expected)
  end
end
