class HomePage < Page

  page_url login_url
  link(:open_login_page, :text =>  "Login")

  def open_login
    open_login_page
  end
end