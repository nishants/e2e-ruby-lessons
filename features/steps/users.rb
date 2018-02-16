Given(/^I open zinc homepage$/) do
  visit(HomePage)
end

Then(/^I click on login$/) do
  on(HomePage).open_login
end

Then("I enter username and password for {string}") do |userid|
  user = @users.get(userid)
  on(LoginForm).login(user["username"], user["password"])
end

Then(/^I see homepage with site admin link in top bar$/) do
	is_site_admin_visible = on(HomePage).site_admin_visible?
	expect(is_site_admin_visible).to eq(true)
end

And(/^I do not see site admin link and admin button$/) do
  is_site_admin_link_visible = on(HomePage).site_admin_visible?
  expect(is_site_admin_link_visible).to eq(false)

  is_admin_button_visible = on(HomePage).admin_button_visible?
  expect(is_admin_button_visible).to eq(false)
end
