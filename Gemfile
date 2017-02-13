source 'https://rubygems.org'
ruby "2.3.3"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'

gem "awesome_print"
gem "authy"
gem "babel-transpiler"
gem "bootstrap-sass"
gem 'coffee-rails', '~> 4.2'
gem "delayed_job_active_record"
gem "devise"
gem "dotenv-rails"
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'money-rails', '~> 1.8'
gem "paper_trail"
gem "paypal-sdk-rest"
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'pundit'
gem 'sass-rails', '~> 5.0'
gem "simple_form"
gem "slim-rails", github: "slim-template/slim-rails"
gem "sprockets", github: "rails/sprockets"
gem "stripe"
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# START: active_admin
gem "activeadmin", github: "activeadmin/activeadmin"
gem "active_admin_theme"
gem "inherited_resources", github: "activeadmin/inherited_resources"
gem "ransack", github: "activerecord-hackery/ransack"
gem "draper", "> 3.x"
# END: active_admin

group :development, :test do
  gem "byebug", platform: :mri
  gem "factory_girl_rails"
  gem "faker"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rspec-rails"
  gem "rubocop"
end

group :development do
  gem "foreman"
  gem "listen"
  gem "rails_layout"
  gem "slim_lint"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  gem "spring"
  gem "web-console"
end

group :test do
  gem "capybara-screenshot"
  gem "capybara"
  gem "database_cleaner"
  gem "fake_stripe"
  gem "launchy"
  gem "poltergeist"
  gem "selenium-webdriver"
  gem "sinatra", github: "sinatra/sinatra"
  gem "vcr"
  gem "webmock"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
