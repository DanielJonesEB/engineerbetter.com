require 'capybara'

session = Capybara::Session.new(:webkit)
session.visit "http://www-dev.enginerbetter.com"

if session.has_content?("Deliver your core value, faster")
  puts "EB Tagline found!"
else
  puts "No tagline found :("
  exit(-1)
end
