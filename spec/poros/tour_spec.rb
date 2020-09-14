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

    expect(tour.rino_coordinates.length).to eq(4)
    expect(tour.id).to eq(2)
    expect(tour.name).to eq("RiNo Tour")
    expect(tour.link).to be_a(String)
  end

  it "can get santa fe tour data" do
    user = FactoryBot.create(:user)
    user.street_arts.create!({
      latitude: '39.735562',
      longitude: '-104.998610',
      address: '1210 Santa Fe Drive',
      city: 'Denver',
      state: 'CO',
      zipcode: '80204',
      image_urls: ["https://res.cloudinary.com/ds6dxgvxo/image/upload/v1600121456/Screen_Shot_2020-09-14_at_4.10.48_PM_qjcdiy.png"],
      description: 'Aztec royalty'
      })

    user.street_arts.create!({
      latitude: '39.731741',
      longitude: '-104.998976',
      address: '965 Santa Fe Drive',
      city: 'Denver',
      state: 'CO',
      zipcode: '80204',
      image_urls: ["https://res.cloudinary.com/ds6dxgvxo/image/upload/v1600121858/Screen_Shot_2020-09-14_at_4.17.10_PM_metdcc.png"],
      description: 'Skeleton playing guitar',
      artist_name: 'Jaime Molina',
      instagram_handle: 'cuttyup'
      })

    tour = SantaFeTour.new

    expect(tour.santafe_coordinates.length).to eq(2)
    expect(tour.id).to eq(3)
    expect(tour.name).to eq("Santa Fe Art District Tour")
    expect(tour.link).to be_a(String)
  end
end
