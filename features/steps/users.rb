Given(/^I open zinc homepage$/) do
  visit(HomePage)
end

Then(/^I click on login$/) do
  on(HomePage).click_login
end

Then(/^I see homepage with site admin link in top bar$/) do
  expect(on(HomePage).site_admin_link_visible?).to eq(true)
end

And(/^I enter username and password for "([^"]*)" user$/) do |user|
  user = @users.get(user)
  on(LoginPage).login_with(user)
end

And(/^I can open admin section$/) do
  on(HomePage).open_site_admin
  expect(on(SiteAdminPage).opened?).to eq(true)
end
