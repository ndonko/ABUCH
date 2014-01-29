source :rubygems

gem 'sinatra'
gem 'sinatra-contrib'
gem 'foreman'
gem 'data_mapper'
gem 'shotgun'

group :development, :test do
  gem 'mysql2'
  gem 'dm-mysql-adapter'
end

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
end

group :test do
  gem 'rspec'
  gem 'rack-test', require: 'rack/test'
end

