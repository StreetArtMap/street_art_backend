# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = FactoryBot.create(:user)
15.times do
  FactoryBot.create(:street_art, user: user)
end
# factory :street_art do
#   association :user
#   latitude { Faker::Address.latitude }
#   longitude { Faker::Address.longitude }
#   address { Faker::Address.street_address }
#   city { Faker::Movies::LordOfTheRings.location }
#   state { Faker::Address.state_abbr }
#   zipcode { Faker::Address.zip }
#   image_urls {[ Faker::Fillmurray.image, Faker::Fillmurray.image, Faker::Fillmurray.image ]}
#   description { Faker::Movies::StarWars.quote }
#   artist_name { Faker::Artist.name }
# end
user = User.create(username: "Hank Hill", email: "ProPAIN@aol.com")

user.street_arts.create(latitude: "39.7666", longitude: "104.9837", address: "RiNo", city: "Denver", state: "CO", zipcode: "80216", image_urls: ["https://cdn.5280.com/2017/04/RiNo-neighborhood-street-art.jpg"], description: "neat-o!", artist_name: "Larry", art_name: "cool-art-1", favorite: true, visited: true)
user.street_arts.create(latitude: "39.7527", longitude: "105.0017", address: "LoDo", city: "Denver", state: "CO", zipcode: "80202", image_urls: ["https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTW8zd6DEZ5UHfY8r8NJB-jEcpGAlbHlwg6Cg&usqp=CAU"], description: "neat-o!", artist_name: "Larry",  art_name: "cool-art-2", instagram_handle: "@insta", favorite: false, visited: true)
user.street_arts.create(latitude: "39.7581", longitude: "104.9874", address: "Five Points", city: "Denver", state: "CO", zipcode: "80216", image_urls: ["https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRe-qGNr3_dvdgNqE6g81qa4OTlSvmfbiGCRw&usqp=CAU"], description: "woww!", artist_name: "Sammi", instagram_handle: "@insta", favorite: true, visited: true)
StreetArt.create!({})
