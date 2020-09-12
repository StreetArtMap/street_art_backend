require 'rails_helper'

describe Tour, type: :poro do
  it "can get colfax tour data" do
    user = FactoryBot.create(:user)
    user.street_arts.create!({
      latitude: '39.740254',
      longitude: '-104.966621',
      address: '1717 E Colfax Ave',
      city: 'Denver',
      state: 'CO',
      zipcode: '80218',
      image_urls: "['/public/boxing_nurse.png']",
      description:'Nurse wearing boxing gloves.',
      artist_name: 'Austin Zucchini-Fowler',
      instagram_handle: 'austinzart'
      })
    tour = ColfaxTour.new

    expect(tour.id).to eq(1)
    expect(tour.name).to eq("Colfax Tour")
    expect(tour.link).to be_a(String)
  end

  it "can get rino tour data" do
    user = FactoryBot.create(:user)
    user.street_arts.create!({
      latitude: '39.740254',
      longitude: '-104.966621',
      address: '1717 E Colfax Ave',
      city: 'Denver',
      state: 'CO',
      zipcode: '80218',
      image_urls: "['/public/boxing_nurse.png']",
      description:'Nurse wearing boxing gloves.',
      artist_name: 'Austin Zucchini-Fowler',
      instagram_handle: 'austinzart'
      })
    tour = RinoTour.new

    expect(tour.id).to eq(2)
    expect(tour.name).to eq("RiNo Tour")
    expect(tour.link).to be_a(String)
  end

  it "can get broadway tour data" do
    user = FactoryBot.create(:user)
    user.street_arts.create!({
      latitude: '39.740254',
      longitude: '-104.966621',
      address: '1717 E Colfax Ave',
      city: 'Denver',
      state: 'CO',
      zipcode: '80218',
      image_urls: "['/public/boxing_nurse.png']",
      description:'Nurse wearing boxing gloves.',
      artist_name: 'Austin Zucchini-Fowler',
      instagram_handle: 'austinzart'
      })
    tour = BroadwayTour.new

    expect(tour.id).to eq(3)
    expect(tour.name).to eq("Broadway Tour")
    expect(tour.link).to be_a(String)
  end
end
