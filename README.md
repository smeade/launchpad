Launchpad
=========

A starter, demonstration and reference application which does almost nothing useful.

**Implemented:**

* Rails 4.1.x w/ JQuery, Coffeescript, Sass, ERB, Turbolinks

**TODO:**

Consider implementing support for:

* Test Unit and FactoryGirl for testing
* Bootstrap front-end framework
* Heroku deployment
* Postgres database
* Database initialization via seeds.rb
* Devise for authentication (including guest user pattern)
* Email delivery (SendGrid, Mandrill)
* Image and file uploads (Carrierwave, Paperclip, aws-sdk & fog)
* User avatars (gravatar_image_tag & gravatar-ultimate)
* Payments (Stripe)
* Activity feed (PublicActivity)
* Data-driven about/tour/info pages
* Tagging stuff
* Searching stuff (algolia)
* Dismissible, data-driven system announcements
* Account management (invite users)
* CSV imports and exports
* RailsAdmin for back-end data management
* Creating fake data with faker
* Variants for mobile view support
* Visitor Analytics (Google, NewRelic)
* Error tracking (rollbar, honeybadger)
* Better Errors
* Annotate
* Flutie
* FriendlyId
* Other?


## Getting Started

1. Install gems:

        bundle install

2. Create and migrate the database:

        rake db:create db:migrate

3. Start the web server:

        rails server

## TBD

* Ruby version

* System dependencies

* Configuration

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## License

This project is released under the [MIT License](http://www.opensource.org/licenses/MIT).