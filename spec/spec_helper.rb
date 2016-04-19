require 'capybara'
require 'capybara-webkit'
require 'capybara/rspec'

Capybara.configure do |config|
  config.default_driver = :webkit
  config.run_server = false
  config.app_host   = 'http://www-dev.engineerbetter.com'
end
