require 'capybara'
require 'capybara-webkit'
require 'capybara/rspec'

Capybara.configure do |config|

  environment = ENV.fetch("SPEC_APP_HOST")

  config.default_driver = :webkit
  config.run_server = false
  config.app_host = environment

end
