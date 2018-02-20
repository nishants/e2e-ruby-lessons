@users @functional
Feature: Login as zinc user

  @admin
  Scenario: Login as zinc admin
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for "fagun-site-admin"
    Then  I see homepage with site admin link in top bar

  @student
  Scenario: Login as a zinc student
     Given I open zinc homepage
     Then  I click on login
     And   I enter username and password for "fagun-student"
     And   I do not see site admin link and admin button

  @schoolAdmin
  Scenario: Login as a school admin
    Given  I open zinc homepage
    Then   I click on login
    And    I enter username and password for "fagun-school-admin"
    And    I do not see site admin link
    And    I see Admin link button
    Given  I click on Admin tab
    Then   I should see Schools, Admins, Teachers and Students tabs

  @teacher
  Scenario: Login as a school teacher
    Given  I open zinc homepage
    Then   I click on login
    And    I enter username and password for "fagun-teacher"
    And    I do not see site admin link
    And    I see Admin link button
    Given  I click on Admin tab
    Then   I should see Classes and Students tabs
    #And    I should not see Schools, Admins and Teachers tabs