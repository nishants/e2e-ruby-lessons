class SiteAdminPage < Page

  def opened?
    @browser.element(:class => 'administration_namespace').visible?
  end

end