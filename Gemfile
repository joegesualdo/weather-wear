source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'

# Database ======================
gem 'pg'

# Authentication ================
gem 'devise'

# API Formatting ========================
gem 'jbuilder', '~> 2.0'
gem 'active_model_serializers'

# Making requests
gem 'rack-cors', :require => 'rack/cors'

# Weather Services ===================

# Development ========================
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-zeus'
  gem 'guard-rspec', require: false
  gem 'annotate', '~> 2.6.5'
end

# Development/Tests ========================
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails', "~> 4.0"
  # Removing due to dependency on debugger gem, which
  # no longer works with ruby 2.X
  # TODO: find alternative for console style
  # gem 'jazz_hands'
  gem 'pry-rails'
end

# Test ========================
group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'shoulda-matchers', require: false
  gem 'zeus'
end
