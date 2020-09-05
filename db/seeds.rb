# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "Hank Hill", email: "ProPAIN@aol.com")
user.street_arts.create(latitude: "39.742043", longitude: "-104.991531", address: "123 fakeplace", city: "Denver", state: "CO", zipcode: "80128", image_urls: ["https://images.freeimages.com/images/large-previews/5b5/bristles-1173194.jpg"], description: "neat-o!", artist_name: "Larry", favorite: true, visited: true)
