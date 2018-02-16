class LoginForm < Page 

	def login(username, password)
		@browser.text_field(:id => 'user_email').set(username)
		@browser.text_field(:id => 'user_password').set(password)
		@browser.element(:value => 'Sign in').click
	end

end