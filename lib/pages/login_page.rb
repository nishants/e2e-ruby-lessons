class LoginPage < Page

  def login_with(user)
    @browser.text_field(:id => 'user_email').set(user['username'])
    @browser.text_field(:id => 'user_password').set(user['password'])
    @browser.button(:text => 'Sign in').click
  end
end