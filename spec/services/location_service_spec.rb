describe LocationService do
  it 'gets coordinates with address' do
    json = LocationService.new.get_coordinates("200 E Colfax Ave., Denver, CO 80203")
    expect(json).to be_a(Hash)
    expect(json[:results][0][:locations][0][:latLng][:lat]).to eq(39.740023)
    expect(json[:results][0][:locations][0][:latLng][:lng]).to eq(-104.985053)
  end

  it 'gets address with coordinates' do
    json = LocationService.new.get_address("39.740023, -104.985053")
    expect(json).to be_a(Hash)
    expect(json[:results][0][:locations][0][:street]).to eq("201 E Colfax Ave")
    expect(json[:results][0][:locations][0][:adminArea5]).to eq("Denver")
    expect(json[:results][0][:locations][0][:adminArea3]).to eq("CO")
    expect(json[:results][0][:locations][0][:postalCode]).to eq("80203-1715")
  end
end
