# Street Art Gallery - Backend Service

## Introduction

This application is a Ruby on Rails API service, utilizing GraphQL to create user-friendly endpoints. Our database is built using Postgres. You can find our schema in the section below.

[Production link](https://streetwalker-backend.herokuapp.com/)

## Schema

## Endpoints

## Tech Stack

- Rails 5.1.7
- Ruby 2.6.3
- PostgreSQL
- GraphQL

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

You will also need to put your API Key for mapquest into the `config/application.yml` file, and then `.gitignore` this file. Start by running:

- `$ bundle exec figaro install`

Troubleshooting support for the figaro gem can be found [here](https://github.com/laserlemon/figaro). Be careful not to push your key up to github before adding the file to `.gitignore`!

Once this is all set up and you aren't getting any errors you can run our test suite.

- `$ bundle exec rspec`

*If there is a problem with the database and you need to scrap and start over:

- `$ rake db:drop`

Then run the three `db` commands above.

### Troubleshooting

If the `db:seed` command works, there is no return value. Pay attention to what comes back because you may not realize that your seeding has failed. You can track down errors in the `db/seeds` file. The seeds are generated using FactoryBot, and the specifications are found in `spec/factories`. You can find out more about Faker [here](https://github.com/faker-ruby/faker) and FactoryBot [here](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md).
