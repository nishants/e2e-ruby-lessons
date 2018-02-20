class AdminView < Page

  def adminvu
    @browser.element(:text => 'Admin').click
  end

  def classes_tab_visible?
    @browser.element(:text => 'Classes').exist?
  end

  def admins_tab_visible?
    @browser.element(:text => 'Admins').exist?
  end

  def students_tab_visible?
    @browser.element(:text => 'Students').exist?
  end

  def schools_tab_visible?
    @browser.element(:text => 'Schools').exist?
  end

end