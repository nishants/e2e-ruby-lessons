When(/^I open google$/) do
  @browser.goto "http://google.com"
end

Then(/^I enter "([^"]*)" in search box$/) do |keyword|
  @browser.text_field(:class => 'gsfi').set(keyword)
end

And(/^I press enter$/) do
  @browser.text_field(:class => 'gsfi').send_keys(:enter)
end


Then(/^I see "([^"]*)" in search results$/) do |arg|
  @browser.element(:text => 'www.zinclearninglabs.com')
end


Then(/^I see "([^"]*)" as first search result$/) do |expected|
  search_results = @browser.elements(:tag_name => 'cite')
  first_result = search_results[0].text
  expect(first_result).to eq(expected)
end