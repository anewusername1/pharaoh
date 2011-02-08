Given /^I debug/ do
  require 'debugger'
  debugger
  true
end

Given /^I have the following "([^"]*)s*":$/ do |object, table|
  table.hashes.each do |object_data|
    puts "#{object} - #{object_data.inspect}"
    Factory.create(object, object_data)
  end
end

Given /^I am logged in as "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

