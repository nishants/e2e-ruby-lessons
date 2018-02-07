class LoginPage < Page

  text_field(:user_name, :id =>  "user_email")
  text_field(:password,  :id =>  "user_password")
  button(    :login,     :text =>  "Sign in")

  def login(user)
    user_name_element.when_present.send_keys(user["username"])
    password_element.when_present.send_keys(user["password"])
    login_element.when_present.click
  end
end