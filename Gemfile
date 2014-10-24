source 'https://rubygems.org'

ruby '2.1.3'

# --------------------------------------------------------------------
# Vanilla Rails gems
# These come from initial Rails project creation
# --------------------------------------------------------------------
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]



# --------------------------------------------------------------------
# Added gems
# These, I added to this project
# --------------------------------------------------------------------
# Use Bootstrap as the HTML, CSS, and JS framework
# Use bootstrap-generators to generate Bootstrap-ready Rails scaffold view templates
gem 'bootstrap-generators', '~> 3.1.1'

# Use Devise for authentication
gem 'devise'

# Use Exception Notification to send exceptions by email
gem 'exception_notification'

# Use goecoder to find location by ip address
gem 'geocoder'

# Use kaminari for pagination
gem 'kaminari'

# Integrate DataTables into Rails pipeline
gem 'jquery-datatables-rails', '~> 2.2.1'

# Use Omniauth for login via github
gem 'omniauth-github'

# Use Roo to work with spreadsheets
gem 'roo'

# Integrate Select2 jQuery plugin into Rails pipeline
gem 'select2-rails'

# Use useragent to detect unsupported browsers
gem 'useragent'

group :production do
  gem 'rails_12factor'
end

group :development do
  # Annotate models
  # annotate -p after
  gem 'annotate'

  # Replace the standard Rails error page
  gem "better_errors"
  gem "binding_of_caller"

  # Show emails in browser
  gem 'letter_opener'

  # Prune log output
  gem 'quiet_assets'
end

group :development, :test do
  gem 'byebug'
end
