source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'

# Database ======================
gem 'pg'

# Authentication ================
gem 'devise'

# API Formatting ========================
gem 'jbuilder', '~> 2.0'

# Weather Services ===================

# Development ========================
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-zeus'
  gem 'guard-rspec', require: false
end

# Development/Tests ========================
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails', "~> 4.0"
  gem 'jazz_hands'
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
