Given(/^I open zinc homepage$/) do
  on(HomePage).visit_home
end

Then(/^I click on login$/) do
  on(HomePage).open_login
end

And(/^I enter username and password for admin user$/) do
 	on(LoginForm).login("fagun@zinclearninglabs.com", "Fagun@456")
end

Then(/^I see homepage with site admin link in top bar$/) do
	is_site_admin_visible = on(HomePage).site_admin
	expect(is_site_admin_visible).to eq(true)
end

And(/^I enter username and password for student user$/) do
	on(LoginForm).login("fagun.bhavsar@gmail.com", "Fagun@456")
end

Then(/^I see homepage for student user$/) do
	is_stuent_user_visible = on(HomePage).student_view
	expect(is_stuent_user_visible).to eq(true)
end

And(/^I do not see site admin link and admin button$/) do
  is_site_admin_link_visible = on(HomePage).site_admin
  expect(is_site_admin_link_visible).to eq(false)

  is_admin_button_visible = on(HomePage).admin_button_visible
  expect(is_admin_button_visible).to eq(false)
end

