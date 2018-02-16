Given(/^I open zinc homepage$/) do
  visit(HomePage)
end

Then(/^I click on login$/) do
  on(HomePage).open_login
end

And(/^I enter username and password for admin user$/) do
  user = @users.get("fagun-site-admin")
 	on(LoginForm).login(user["username"], user["password"])
end

Then(/^I see homepage with site admin link in top bar$/) do
	is_site_admin_visible = on(HomePage).site_admin_visible?
	expect(is_site_admin_visible).to eq(true)
end

And(/^I enter username and password for student user$/) do
  user = @users.get("fagun-student")
	on(LoginForm).login(user["username"], user["password"])
end

And(/^I do not see site admin link and admin button$/) do
  is_site_admin_link_visible = on(HomePage).site_admin_visible?
  expect(is_site_admin_link_visible).to eq(false)

  is_admin_button_visible = on(HomePage).admin_button_visible?
  expect(is_admin_button_visible).to eq(false)
end

