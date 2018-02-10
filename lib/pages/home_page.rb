class HomePage < Page
  page_url base_url

  def click_login
    @browser.element(:text => 'Login').click
  end

  def site_admin_link_visible?
    @browser.element(:text => '(Site Admin)').visible?
  end
end