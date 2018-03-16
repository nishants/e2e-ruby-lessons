Given(/^I open zinc homepage$/) do
  visit(HomePage)
end

Then(/^I click on login$/) do
  on(HomePage).open_login
end

Then("I enter username and password for {string}") do |userid|
  user = @users.get(userid)
  #require "pry"; binding.pry
  on(LoginForm).login(user["username"], user["password"])
  on(HomePage).wait_till_logged_in
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

And(/^I do not see site admin link$/) do
  is_site_admin_link_visible = on(HomePage).site_admin_visible?
  expect(is_site_admin_link_visible).to eq(false)
end

And(/^I see Admin link button$/)  do
  is_admin_button_visible = on(HomePage).admin_button_visible?
  #require "pry"; binding.pry
  expect(is_admin_button_visible).to eq(true)
end

Given(/^I click on Admin tab$/) do
  on(AdminView).adminvu
end

And(/^I should see Classes and Students tabs$/) do
  is_classes_tab_visible = on(AdminView).classes_tab_visible?
  expect(is_classes_tab_visible).to eq(true)

  is_students_tab_visible = on(AdminView).students_tab_visible?
  expect(is_students_tab_visible).to eq(true)
end

And(/^I should see Schools, Admins, Teachers and Students tab$/)  do
  is_schools_tab_visible = on(AdminView).schools_tab_visible?
  expect(is_schools_tab_visible).to eq(true)

  is_admins_tab_visible = on(AdminView).admins_tab_visible?
  expect(is_admins_tab_visible).to eq(true)

  is_students_tab_visible = on(AdminView).students_tab_visible?
  expect(is_students_tab_visible).to eq(true)
end

And(/^I see following sections in top bar$/) do |table|
   expected = table.raw.map{|val| val[0].downcase}
   actual = on(HomePage).get_visible_tabs
   expect(actual).to eq(expected)
end

And(/^I should see my username with following profile options$/) do |table|
    actual_username_is = on(HomePage).username_visible?
    expect(actual_username_is).to eq(@data["user_nickname"])
    #require "pry"; binding.pry;
    expected = table.raw.map{|val| val[0].downcase}
    actual = on(HomePage).get_username_profile
    expect(actual).to eq(expected)
end
