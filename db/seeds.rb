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
