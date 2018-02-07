class VocabularyPage < Page

  page_url login_url
  span(:in_progress         , :text =>  "My Games In Progress")
  button(:search_for_games  , :text =>  "Go")

  button(:select_category   , :class =>  "multiSelectButton", :index => 0)
  button(:select_grade      , :class =>  "multiSelectButton", :index => 1)

  div(:category_dropdown    , :class =>  "checkBoxContainer", :index => 0)
  div(:grade_dropdown       , :class =>  "checkBoxContainer", :index => 1)

  div(:create_by_zinc       , :class =>  "set_listing_section_container", :index => 0)
  div(:create_by_teachers   , :class =>  "set_listing_section_container", :index => 1)

  div(:flash_message        , :class =>  "vocab_flash")

  div(:search_container        , :class =>  "search_input_container")
  button(:search_key        , :text =>  "Go")

  def has_games_in_progess
     in_progress_element.present?
  end

  def search_games
    search_for_games_element.when_present.click
  end

  def filter_by_category(list)
    select_category_element.when_present.click
    timeout
    category_dropdown_element.divs(:class => 'multiSelectItem' ).each{|div|
      div.div(:class => 'acol', :index => 0).click if list.include? div.text.strip
    }
  end

  def filter_by_grades(list)
    select_grade_element.when_present.click
    timeout
    grade_dropdown_element.divs(:class => 'multiSelectItem' ).each{|div|
      target = div.div(:class => 'acol', :index => 0)
      if list.include? div.text.strip
        # scroll to item
        timeout
        @browser.execute_script('arguments[0].scrollIntoView();', target)
        timeout
        target.click
      end
    }
  end

  def visible_games
    timeout
    flash_message_element.wait_while_present
    timeout_long
    by_zinc = create_by_zinc_element.divs(:class => 'set_title').map{|title| title.text.gsub("\"", "'")}
    by_teachers = create_by_teachers_element.divs(:class => 'set_title').map{|title| title.text.gsub("\"", "'")}
    {
        "by_zinc"     => by_zinc,
        "by_teachers" => by_teachers,
    }
  end

  def search_for(key)
    search_container_element.when_present.text_field(:index => 0).set(key)
    search_key
  end

  def contents
    {
        "by_zinc"     => create_by_zinc_element,
        "by_teachers" => create_by_teachers_element,
    }
  end

  def next_of(created_by)
    contents[created_by].when_present.link(:text => "Next ›").when_present.click
  end

  def previous_of(created_by)
    contents[created_by].when_present.link(:text => "‹ Prev").when_present.click
  end

end