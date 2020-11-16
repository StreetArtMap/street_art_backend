FactoryBot.define do
  factory :user do
    username { Faker::Movies::LordOfTheRings.character }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
  end
end
