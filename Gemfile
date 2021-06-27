source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails',                        '~> 6.1.1'
gem 'puma',                         '~> 5.0'

# --- DBs and storages ---
gem 'pg',                           '~> 1.2.3'

# --- UI/UX tools ---
gem 'webpacker',                    '~> 5.2.1'
gem 'turbolinks',                   '~> 5'
gem 'jbuilder',                     '~> 2.7'
gem 'haml',                         '~> 5.1.2'
gem 'sass-rails',                   '>= 6'

gem 'bootsnap',                     '>= 1.4.4', require: false

group :development, :test do
  gem 'rspec-rails',                '~> 4.0.2'
  gem 'factory_bot_rails',          '~> 6.1.0'
  gem 'byebug',                     platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',                '>= 4.1.0'
  gem 'rack-mini-profiler',         '~> 2.0'
  gem 'listen',                     '~> 3.3'
end

gem 'tzinfo-data',                  platforms: [:mingw, :mswin, :x64_mingw, :jruby]
