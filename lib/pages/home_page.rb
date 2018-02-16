class HomePage < Page 

	def visit_home
		@browser.goto("http://staging.zinclearninglabs.com/")
	end
	
	def open_login
		@browser.element(:text => 'Login').click
	end

	def site_admin
		return @browser.element(:text => '(Site Admin)').visible? 
	end 

	def student_view
		return @browser.element(:text => 'Classes').present?
	end

	def student_admin_view
		return @browser.element(:text => '(Site Admin)').exist?
	    return @browser.element(:text => 'Admin').exist?
	end
	    
end