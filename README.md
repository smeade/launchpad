Launchpad
=========

A bloging app with posts. This is intended as a starter, demonstration and reference application which does almost nothing useful. Posts are used merely as a way to have something to work with while playing with and learning about generic features used in almost all apps.

**Done:**

This app currently demonstrates:

* Rails 4.1.x w/ JQuery, Coffeescript, Sass, ERB, Turbolinks
* PostgreSQL
* Bootstrap
* Annotated models
* Heroku deployment
* Database initialization via seeds.rb
* Bootstrap themes support
* Devise for authentication
* CSV (and Excel) imports
* Better Errors for a more usefull dev error page
* Select2


**TODO:**

Consider implementing support for:

* Comments
* Use FontAwesome instead of Glyphicons
* Test Unit and FactoryGirl for testing
* Guest user pattern
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
* CSV exports
* RailsAdmin for back-end data management
* Creating fake data with faker
* Variants for mobile view support
* Visitor Analytics (Google, NewRelic)
* Error tracking (rollbar, honeybadger)
* SweetAlert (http://tristanedwards.me/sweetalert)
* Flutie
* FriendlyId
* Pagination
* Markdown/Text editing
* Procfile
* Customize color scheme by Account
* Other?


Getting Started
---------------

### Clone, configure and run locally

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

4. Create, migrate and seed the database:

        rake db:create db:migrate db:seed

5. Start the web server:

        rails server

### Deploy to Heroku

1. Download and install the [Heroku toolbelt](https://devcenter.heroku.com/articles/getting-started-with-rails4#local-workstation-setup)].

2. Create your [Heroku app](https://devcenter.heroku.com/articles/getting-started-with-rails4#deploy-your-application-to-heroku) (if not already created).

        heroku apps:create

3. Deploy. [details](https://devcenter.heroku.com/articles/git#deploying-code).

        git push heroku master

4. Run migrations (if any new ones)

        heroku run rake db:migrate

5. Visit the deployed app

        heroku open

### Heroku Notes

* The [rails_12factor gem](https://github.com/heroku/rails_12factor) is [required](https://devcenter.heroku.com/articles/getting-started-with-rails4#heroku-gems).
* Heroku provides you a PostgreSQL database so use PostgreSQL locally to maintain parity between local development and the deployed app.
* If an app fails to start, attempting to start a console will give more detail than is found in the app logs.
* Logging and console:

        $ heroku logs -t
        $ heroku run console

* Deploying:

        $ git push heroku master
        $ heroku run rake db:migrate
        $ heroku open


## TBD

* Ruby version

* System dependencies

* Configuration

* Database initialization

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Additional Notes and Background
-------------------------------

### Annotate

    annotate -p after

### Bootstrap

* Drop in or edit app/assets/stylesheets/bootstrap.css.scss to change theme.
* Use @import instead of *=require_
  * Rename application.css to application.css.scss
  * @import scss files, in proper order

### Bootstrap Glyphicons/Icons

To get Bootstrap fonts working with the Asset pipeline:

* Added Bootstrap font files to vendor/assets/fonts/
* Use `font-url` helper in the font-url block in base.css.scss
* In config/environments/production.rb:

        config.assets.compile = true

### Bootstrap Generators

* Bootstrap Generators installs its templates under lib/templates
* You can go and customize them.
* One-time run of "rails generate bootstrap:install -f"
  * updated layouts/application.html.erb
  * created templates in lib/templates
  * created stylesheets
* The config.generators block seems to be required in application.rb

### Devise

* Heroku default_url_options

Devise uses the default url options in your environments files for composing relative links in confirmation and password recovery emails. For Heroku, configure and use a MAIL_HOST environment variable.

From the command line:

        heroku config:add MAIL_HOST=[YOUR APP URL]

In `production.rb`:

        config.action_mailer.default_url_options = { host: ENV['MAIL_HOST'] }

* Review `config\initializers\devise.rb` for a variety of configuration options. As with all initializers, restart after modifying.

For example:

        config.password_length = 4..128

* Review `devise.em.yml` (or locale file of your choice) for configurable messaging.

* Read about required [test helpers](https://github.com/plataformatec/devise#test-helpers).

### Tests

This is a bare-bones Rails app without any business-logic or custom functionality. As such, there is no testing beyond that which is generated by Rails scaffold. This fits perfectly within the realm of "Don't test the framework".

To run the test suite:

    $ rake

License
-------
This project is released under the [MIT License](http://www.opensource.org/licenses/MIT).