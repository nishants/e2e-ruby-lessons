class HomePage < Page
	page_url	base_url
	
	def open_login
		@browser.element(:text => 'Login').click
	end

	def site_admin_visible?
		@browser.element(:text => '(Site Admin)').exist?
	end 

	def student_view
		@browser.element(:text => 'Classes').exist?
	end

	def admin_button_visible?
		@browser.element(:text => 'Admin').exist?
	end

end
