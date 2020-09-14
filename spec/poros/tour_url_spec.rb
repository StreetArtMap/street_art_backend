require 'rails_helper'

describe 'TourUrl', type: :poro do
  it 'generates url string from coordinates' do
    coordinates = [["39.757300", "-104.986918"], ["39.758697", "-104.985510"], ["39.759241", "-104.985322"], ["39.760942", "-104.983589"]]

    url = TourUrl.new(coordinates).create_url

    expect(TourUrl.new(coordinates).coordinates).to eq(coordinates)
    expect(TourUrl.new(coordinates).origin).to eq('39.757300,-104.986918')
    expect(TourUrl.new(coordinates).center).to eq('@39.759121,-104.9852535,')
  end
end
