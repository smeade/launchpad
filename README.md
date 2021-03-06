Launchpad
=========

A bloging app with posts. This is intended as a starter, demonstration and reference application which does almost nothing useful. Posts are used merely as a way to have something to work with while playing with and learning about generic features used in almost all apps.

**Done:**

This app demonstrates:

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
* Select2 with ajax data source and createSearchChoice
* DataTables
* Working with JavaScript in Rails (via Comments)
* Geocoding with the geocoding gem
* Sign in with GitHub (via OmniAuth)
* Exception notifications via email
* Forcing SSL over entire site
* byebug for debugging
* Browser version checks
* RailsAdmin for back-end data management
* RSpec and FactoryGirl for testing
* Use of data-* instead of css id's and classes for js actions
* Scope to Account by subdomain
* Ajax status changes ('approved', 'question', 'rejected')
* Auditing and versioning with PaperTrail
* Elasticsearch and Searchkick
* Tooltips
* Caching
* Turbolinks

**TODO:**

Consider implementing support for:

* Guard for testing
* rack-mini-profiler
* Devise custom controllers
* Add CanCan for authorization
* Switching to Bourbon
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
* Account management (invite users, with subdomains)
* CSV exports
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

### Versions

* Ruby version 2.1.3
* Rails version 4.1.6

### Ajax

Based on RailsGuides documentation [Working with JavaScript in Rails](http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html).

See Comment views and controller, specificallY:

* add `remote: true` to comments/_form.html.erb
* add `format.js {}` to comments#create `respond_to` block
* add `app/views/comments/create.js.erb`

### Accounts

* Account belongs to a User - the account owner. User belongs to an account - account members.
* Accounts have a subdomain attribute. Requests to accountSubdomain.host.com will show only posts from that account's users.

* When a user signs up, they get an Account. In the future, will add an account invite system.
* For now, the Account is used as a way to demonstrate subdomain logic.

### Annotate

    annotate -p after

### Byebug

[byebug](https://github.com/deivid-rodriguez/byebug) for debugging.

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

### Browser Warnings

* Use [useragent](https://github.com/josh/useragent) to parse and compares HTTP User Agents.
* Create check_browser method in ApplicationController, then:

        before_filter :check_browser

## Rails Caching

Implements [Rails caching](http://guides.rubyonrails.org/caching_with_rails.html).

* Simply wrap view fragments with `cache`

        <%= cache comment do %>
        <% end %>

* Uses key-based cache expiration.

    Note the use of `touch: true` to ensure that updates to child objects create a new cache key

        class Comment < ActiveRecord::Base
          belongs_to :post, touch: true
        end

* To use caching in local dev, enable in development.rb:

        config.action_controller.perform_caching = true

* To use caching on Heroku:

        heroku addons:add memcachier

### DataTables

* Use [jquery-datatables-rails](https://github.com/rweng/jquery-datatables-rails) gem. This takes care of smoothly getting the css, js, and images into the pipeline.
* Create a dedicated `datatables/categories_datatable.rb` class to handle the serving of json in a datatable friendly way.
* See `categories_controller#index` method for use of `CategoriesDatatable` class.

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


### Elasticsearch and Searchkick

[Elasticsearch](https://github.com/elasticsearch/elasticsearch) is an awesome "Open Source, Distributed, RESTful Search Engine http://elasticsearch.org".
[elasticsearch-rails](https://github.com/elasticsearch/elasticsearch-rails) contains various Ruby and Rails integrations for Elasticsearch, including ActiveModel integration with adapters for ActiveRecord and Convenience model methods such as search.
[Searchkick](https://github.com/ankane/searchkick) sits on top of elasticsearch-rails and learns what your users are looking for.

See: http://www.elasticsearch.org/guide/en/elasticsearch/client/ruby-api/current/_ruby_on_rails.html


### Exception Notification

This [gem](https://github.com/smartinez87/exception_notification) provides notifications when errors occur.

1. Add to Gemfile

        gem 'exception_notification'

2. Configure to use `config.middleware.use ExceptionNotifier`. See `development.rb` and `production.rb`.


### Geocoder

[Geocoder](https://github.com/alexreisner/geocoder) is a complete geocoding solution for Ruby. With Rails it adds geocoding (by street or IP address), reverse geocoding (find street address based on given coordinates), and distance queries.

1. Add `latitude` and `longitude` columns to Model

        rails generate migration AddLatitudeAndLongitudeToModel latitude:float longitude:float
        rake db:migrate

2. Tell Geocoder which method returns your object's geocodable address:

        geocoded_by :full_street_address   # can also be an IP address
        after_validation :geocode          # auto-fetch coordinates

3. For reverse geocoding, tell Geocoder which attributes store latitude and longitude:

        reverse_geocoded_by :latitude, :longitude
        after_validation :reverse_geocode  # auto-fetch address

4. Find address by IP:

        Geocoder.search('75.70.68.188').first.data["region_name"]

### GitHub Sign In

* Use [omniauth-github](https://github.com/intridea/omniauth-github) gem

        gem 'omniauth-github'

1. Create an application in GitHub

        https://github.com/settings/applications/new

2. Add provider and uid to Users

        class AddColumnsToUsers < ActiveRecord::Migration
          def change
            add_column :users, :provider, :string
            add_column :users, :uid, :string
          end
        end

3. Add a new OmniAuth provider to `devise.rb`

        config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

4. Enable omniauthable module on User

        :omniauthable, :omniauth_providers => [:github]

5. Create `Users::OmniauthCallbacksController` with `github` method

6. Add route

        devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

7. Implement the `from_omniauth` method in User


### PaperTrail

"PaperTrail lets you track changes to your models' data. It's good for auditing or versioning. You can see how a model looked at any stage in its lifecycle, revert it to any version, and even undelete it after it's been destroyed."

* To Install
1. Add PaperTrail to your `Gemfile`.

    `gem 'paper_trail', '~> 3.0.5'`

2. Generate a migration which will add a `versions` table to your database.

    `bundle exec rails generate paper_trail:install`

3. Run the migration.

    `bundle exec rake db:migrate`

4. Add `has_paper_trail` to the models you want to track.

* Use example:

```
      <%= content_tag_for(:tr, @product.versions.reverse) do |product_version| %>
        <% unless product_version.reify.blank? %>
          <td><%= link_to "restore to this version", revert_version_path(product_version), method: :post %></td>
          <td><%= product_version.reify.updated_at %></td>
          <td><%= product_version.reify.sku %></td>
          <td><%= product_version.reify.name %></td>
        <% end %>
      <% end %>
```

[source](https://github.com/airblade/paper_trail#rails-3--4)


### RailsAdmin

RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data.

* To install
1. Bundle the gem. Use the github version: `gem 'rails_admin', :git => 'https://github.com/sferik/rails_admin.git'`.
2. Run `rails g rails_admin:install`
3. Provide a namespace for the routes when asked
4. Start a server rails s and administer your data at /admin. (if you chose default namespace: /admin)

### RSpec Rails

See https://github.com/rspec/rspec-rails

* To install
1. Add rspec-rails to both the :development and :test groups in the Gemfile:
2. `bundle install`
3. `rails generate rspec:install`
4. create a binstub for the rspec command so it can be run via bin/rspec: `bundle binstubs rspec-core`
5. Run specs: `bundle exec rspec`

* Generators
`rails generate rspec:model post`
`rails generate rspec:controller post`

### Select2

* See the [gem documentation](http://ivaynberg.github.io/select2/).
* Easily integrated into asset pipeline via [select2-rails](https://github.com/argerim/select2-rails).
* See posts.js.coffee for implementation details.
* Note use of createSearchChoice so you can enter new values, not found by the select2 search.
* The select field is being used to populate a string attribute. The `id` is being set to the string.

### SSL

* See [force_ssl](http://apidock.com/rails/ActionController/ForceSSL/ClassMethods/force_ssl).

        force_ssl if: :ssl_configured? #, host:'www.sitewithvalidsslcert.com'

### Tests

This is a bare-bones Rails app without any business-logic or custom functionality. As such, there is no testing beyond that which is generated by Rails scaffold. This fits perfectly within the realm of "Don't test the framework".

To run the test suite:

    $ rake

### TurboLinks

* Remember that with TurboLinks, for JavaScript to load you should not use `$(document).ready`, but use:

        $(document).on "page:change", ->


### Tooltips

Implemented Bootstrap's [tooltips.js](http://getbootstrap.com/javascript/#tooltips).

* For performance reasons, the Tooltip and Popover data-apis are opt-in, meaning you must initialize them yourself.

        $('[data-toggle="tooltip"]').tooltip()

* All that is needed is to set data- elements.

        data-toggle="tooltip" data-placement="top" title="Delete"

        data: {toggle: "tooltip", placement: "top", title: "Remove approval" }


License
-------
This project is released under the [MIT License](http://www.opensource.org/licenses/MIT).