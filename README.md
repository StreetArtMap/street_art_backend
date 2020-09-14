# Street Art Gallery - Backend Service

## Introduction

This application is a Ruby on Rails API service, utilizing GraphQL to create user-friendly endpoints. Our database is built using Postgres and you can find our schema in the section below.

[Production link](https://streetwalker-backend.herokuapp.com/)

## Contributors

[Stella Bonnie](https://github.com/stellakunzang)

[Michael Gallup](https://github.com/Gallup93)

[Jesse Gietzen](https://github.com/elguapogordo)

## Schema

![Schema](/public/schema.png)

## Endpoints

Running on local server:

`POST localhost:3000/graphql`

Running in production:

`POST streetwalker-backend/graphql`

## Queries

#### streetArts

*returns all street art in the database*

  `query {
     streetArts {
         id
         latitude
         longitude
     }
  }`

Sample response:

![streetArts](/public/street_arts_response.png)

#### tours

*returns all street art tours*

  `query {
     tours {
         allTours
     }
  }`

Sample response:

![tours](/public/tours_response.png)

#### users

*returns all users*

  `query {
     users {
         id
         username
     }
  }`

Sample response:

![users](/public/users_response.png)

## Mutations

#### createStreetArt

*Adds a street art object to the database*

  `mutation {
        createStreetArt( input: {
          userId: 2
          latitude: "42.287365"
          longitude: "-89.064301"
          address: "Rock River Bike Path"
          city: "Rockford"
          state: "IL"
          zipcode: "61107"
          description: "Symbol is distracting from a distance yet overwhelming up-close. It stands forty-seven feet tall with a weight of thirty tons"
          artistName: "Alexander Liberman"
          artName: "Symbol"
          imageUrls: "['https://townsquare.media/site/721/files/2016/02/12714350_10207010501954253_1570886039_n.jpg?w=980&q=75']"
        }) {
            id
            latitude
            longitude
            city
            artName
            }
      }`

Sample response:

![createStreetArt](/public/create_street_art.png)

#### favoriteStreetArt

*Toggles favorite status for street art between true and false*

  `mutation {
       favoriteStreetArt( input: {
         streetArtId: 2
         favorite: true
       }) {
           id
           favorite
           }
     }`

Sample response:

![favorite](/public/favorite_response.png)

#### visitStreetArt

*Toggles visited status for street art between true and false*

  `mutation {
       visitStreetArt( input: {
         streetArtId: 2
         visited: true
       }) {
           id
           favorite
           visited
           }
       }`

Sample response:

![visit](/public/visit_response.png)

## Tech Stack

- Rails 5.1.7
- Ruby 2.6.3
- PostgreSQL
- GraphQL
- Heroku
- TravisCI

## Development Implementation Instructions

First you'll need these installed:

* Rails 5.1.7
  - `gem install rails -v 5.1.7`
  - - to verify version, in the CLI run `$rails -v`

* Ruby 2.6.3
  - `rbenv install 2.6.3`
  - to verify version, in the CLI run `$ruby -v`

Next, clone down this repository onto your local machine. Run these commands in order to get required gems and database established:

- `$ bundle install`
- `$ rake db:create`
- `$ rake db:migrate`
- `$ rake db:seed`

You will also need to put your API Key for Mapquest into the `config/application.yml` file, and then `.gitignore` this file. Start by running:

- `$ bundle exec figaro install`

Troubleshooting support for the figaro gem can be found [here](https://github.com/laserlemon/figaro). Be careful not to push your key up to github before adding the file to `.gitignore`!

Once this is all set up and you aren't getting any errors you can run our test suite.

- `$ bundle exec rspec`

*If there is a problem with the database and you need to scrap and start over:

- `$ rake db:drop`

Then run the three `db` commands above.

### Troubleshooting

If the `db:seed` command works, there is no return value. Pay attention to what comes back because you may not realize that your seeding has failed. You can track down errors in the `db/seeds` file.

If the API key is not found, that is likely an error related to figaro. Please see the link above for support troubleshooting.
