Launchpad
=========

A starter, demonstration and reference application which does almost nothing useful.

**Implemented:**

* Rails 4.1.x w/ JQuery, Coffeescript, Sass, ERB, Turbolinks
* Bootstrap front-end framework
* Annotated models

**TODO:**

Consider implementing support for:

* Test Unit and FactoryGirl for testing
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
* SweetAlert (http://tristanedwards.me/sweetalert)
* Better Errors
* Flutie
* FriendlyId
* Other?


Getting Started
---------------
1. Clone the project:

        git clone git@github.com:smeade/launchpad.git your_app_name
        cd your_app_name

2. Rename the project:

  * In `config/application.rb`: replace `Launchpad` with `YourAppName`
  * In `config/database.yml`: replace `launchpad` with `your_app_name`
  * In `config/initializers/session_store.rb`: replace `launchpad` with `your_app_name`
  * In `layouts/application.html.erb`: replace `Launchpad` with `Your App Name`

3. Generate and install new secret:

        rake secret

  * update `config\secrets.yml` with this newly generated secret

3. Install gems:

        bundle install

4. Create and migrate the database:

        rake db:create db:migrate

5. Start the web server:

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


Notes
-----

### Annotate

    annotate -p after

### Bootstrap

* Installed via the bootstrap generators gem.
* one-time run of "rails generate bootstrap:install -f"
  * updated layouts/application.html.erb
  * created templates in lib/templates
  * created stylesheets
* config.generators block required in application.rb
* Use @import instead of *=require_
  * Rename application.css to application.css.scss
  * @import scss files, in proper order


License
-------
This project is released under the [MIT License](http://www.opensource.org/licenses/MIT).