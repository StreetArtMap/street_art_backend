# Street | ART | Walk - Backend Service

<!-- Insert badges here -->

## Table of Contents

1. [Introduction](#intro)
2. [Schema](#schema)
3. [Endpoints](#endpoints)
4. [Queries](#queries)
5. [Mutations](#mutations)
6. [Tech Stack](#stack)
7. [Contributors](#team)
8. [Future Iterations](#future)
9. [Development Implementation Instructions](#implementation)
10. [Troubleshooting](#help)

## Introduction <a name="intro"></a>

[Street | ART | Walk](https://streetartwalk.netlify.app/) is an application where you can upload images of found street art along with location data. You can also view street art added by other users, favorite different pieces of art, mark art as "visited", and find maps for tours of street art in different areas.

This repo houses a Ruby on Rails API service, utilizing GraphQL to create user-friendly endpoints. Our database is built using Postgres and you can find our schema in the section below. If you would like to explore these endpoints independent of the frontend application using postman, our production application is hosted on Heroku [here](https://streetwalker-backend.herokuapp.com/). You can find more instructions in the section below labeled [endpoints](#endpoints).

## Schema <a name="schema"></a>

As you can see, the database is very simple. In the future, if we were to build out authentication, we would change the structure of the database so that `visited` and `favorite` would be more dynamic. To do this, we would create separate tables for these two categories, which would function as joins tables between `street_arts` and `users`. We would also create a separate table for tours, which would have many `street_arts` and belong to `users`. Users would thereby be able to create tours and save them to the database.

![Schema](/public/schema.png)

## Endpoints <a name="endpoints"></a>

Though we had intended to build our entire API service in GraphQL, we ended up creating one RESTful route to satisfy this iteration's need for tours NOT stored in the database.

### REST Endpoint

*in production*
`GET 'https://streetwalker-backend/tours'`

*on local server*
`GET 'localhost:3000/tours'`

Sample response:

![tours](/public/tours_response.png)

### GraphQL Endpoints

Running on local server:

`POST 'localhost:3000/graphql'`

Running in production:

`POST 'https://streetwalker-backend/graphql'`

#### Queries <a name="queries"></a>

**streetArts**

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

**users**

*returns all users*

  `query {

     users {

         id

         username

     }

  }`

Sample response:

![users](/public/users_response.png)

#### Mutations <a name="mutations"></a>

**createStreetArt**

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

**favoriteStreetArt**

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

**visitStreetArt**

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

## Tech Stack <a name="stack"></a>

- Rails 5.1.7
- Ruby 2.6.3
- PostgreSQL
- GraphQL
- Heroku
- TravisCI

## Contributors <a name="team"></a>

#### Backend Team

  [Stella Bonnie](https://github.com/stellakunzang)

  [Michael Gallup](https://github.com/Gallup93)

  [Jesse Gietzen](https://github.com/elguapogordo)

#### Frontend Team

  [Carlos Flores](https://github.com/carflor)

  [Edita Ignot](https://github.com/edignot)

#### Project Managers

  [Megan McMahon](https://github.com/memcmahon)

  [Robbie Jaeger](https://github.com/robbiejaeger)

## Future Iterations <a name="future"></a>

Though we met our MVP for this project, we still have a long list of features we would like to add to future iterations! A few of there were already enumerated above in the [database](#schema) section.

- When selecting a tour, the user is able to specify whether they will be walking, biking, or driving.

- User can submit starting location and/or ending location for tour.

- Users can view a page for a particular artist with all artwork in the database by that artist as well as a map with pins for locations where their artwork can be found.

- Tours exist for artists with a certain number of street art locations in the database.

- Pins on map display a different color if they have been favorited or visited by the user. This color/icon corresponds to the favorite/visit button.

-  If a user wants to add images for a piece of artwork that already exists in the database, they can add images to the existing entry.

- Users can mark if an address is invalid and suggest an update.

- Users can mark when a piece of art is no longer present at that location and submit updated images if new art is there. Art that is no longer visible will go to an "archives" page.

- OAuth with Instagram so users can share posts directly from instagram.

## Development Implementation Instructions <a name="implementation"></a>

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

### Troubleshooting <a name="help"></a>

If the `db:seed` command works, there is no return value. Pay attention to what comes back because you may not realize that your seeding has failed. You can track down errors in the `db/seeds` file.

If the API key is not found, that is likely an error related to figaro. Please see the link above for support troubleshooting.
