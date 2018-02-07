class DashboardPage < Page
  page_url login_url
  link(:vocabulary_link,     :text =>  "Vocabulary")

  def open_vcablulary
    vocabulary_link
  end
end