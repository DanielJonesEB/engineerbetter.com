require 'capybara'
require 'capybara-webkit'

session = Capybara::Session.new(:webkit)
session.visit "http://www-dev.engineerbetter.com"

if session.has_content?("Cloud Foundry")
  puts "EB Tagline found!"
else
  puts "No tagline found :("
  exit( -1)
end
