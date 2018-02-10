class LoginPage < Page

  def login_with(user)
    @browser.text_field(:id => 'user_email').set('karthik.cs@gmail.com')
    @browser.text_field(:id => 'user_password').set('password')
    @browser.button(:text => 'Sign in').click
  end
end