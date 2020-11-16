FactoryBot.define do
  factory :street_art do
    association :user
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    address { Faker::Address.street_address }
    city { Faker::Movies::LordOfTheRings.location }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip }
    image_urls {[ Faker::Fillmurray.image, Faker::Fillmurray.image, Faker::Fillmurray.image ]}
    description { Faker::Movies::StarWars.quote }
    artist_name { Faker::Artist.name }
    user_id {User.last.id}
  end
end
