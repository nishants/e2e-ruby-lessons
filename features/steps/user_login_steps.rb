Then(/^I see "([^"]*)" in search results$/) do |arg|
  @browser.element(:text => 'www.zinclearninglabs.com')
end


Then(/^I see "([^"]*)" as first search result$/) do |expected|
  search_results = @browser.elements(:tag_name => 'cite')
  first_result = search_results[0].text
  expect(first_result).to eq(expected)
end

Given(/^I open zinc homepage$/) do
  @browser.goto "http://staging.zinclearninglabs.com/"
end


Then(/^I click on login$/) do
  @browser.element(:text => 'Login').click
end

And(/^I enter username and password for admin user$/) do
  @browser.text_field(:id => 'user_email').set('karthik.cs@gmail.com')
  @browser.text_field(:id => 'user_password').set('password')
  @browser.button(:text => 'Sign in').click
end

Then(/^I see homepage with site admin link in top bar$/) do
  site_admin_link = @browser.element(:text => '(Site Admin)')
  expect(site_admin_link.visible?).to eq(true)
end
