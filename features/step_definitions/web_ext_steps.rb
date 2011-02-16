Given /^I debug/ do
  require 'debugger'
  debugger
  true
end

Given /^I have the following (.*)s:$/ do |object, table|
  table.hashes.each do |object_data|
    Factory.create(object, object_data)
  end
end

Given /^I am signed in$/ do
  @user ||= Factory.create(:user)
  visit root_path
  click_link_or_button "sign in"
  fill_in "user_email", :with => @user.email
  fill_in "user_password", :with => 'password'
  click_button 'Sign in'
end

Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           :login => login,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}" and login "#{login}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Then /^I am redirected to "([^\"]*)"$/ do |url|
  assert [301, 302].include?(@integration_session.status), "Expected status to be 301 or 302, got #{@integration_session.status}"
  location = @integration_session.headers["Location"]
  assert_equal url, location
  visit location
end

