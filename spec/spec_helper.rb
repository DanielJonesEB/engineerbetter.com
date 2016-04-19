require 'capybara'
require 'capybara-webkit'
require 'capybara/rspec'

Capybara.configure do |config|

  environment = ENV.fetch("ENVIRONMENT")

  config.default_driver = :webkit
  config.run_server = false
  config.app_host   = "http://www-#{environment}.engineerbetter.com"
end
