# README

*Rails version: 5.2.8.1
Ruby version: 2.7.0*

## How to run:

* Open a terminal and enter `docker compose up --build` (--build flag needed only in the first run)
* On another tab of terminal run `docker exec -it embarca-test sh` to open a terminal inside container
* To create databases, run migrations and seed: `rails db:setup`
* To run server: `bundle exec rails s -p 3000 -b '0.0.0.0'`
* To run tests: `rspec`
* To run rubocop: `rubocop`
