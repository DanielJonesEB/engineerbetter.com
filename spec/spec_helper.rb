require 'capybara'
require 'capybara-webkit'
require 'capybara/rspec'

Capybara.configure do |config|

  environment = ENV.fetch("ENVIRONMENT")

  config.default_driver = :webkit
  config.run_server = false

  if environment == "production"
    config.app_host   = "http://www.engineerbetter.com"
  else
    config.app_host   = "http://www-#{environment}.engineerbetter.com"
  end

end
