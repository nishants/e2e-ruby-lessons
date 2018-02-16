class HomePage < Page 

	def visit_home
		@browser.goto("http://staging.zinclearninglabs.com/")
	end
	
	def open_login
		@browser.element(:text => 'Login').click
	end

	def site_admin
		@browser.element(:text => '(Site Admin)').exist?
	end 

	def student_view
		@browser.element(:text => 'Classes').exist?
	end

	def admin_button_visible
		@browser.element(:text => 'Admin').exist?
	end

end