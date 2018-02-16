@users @functional
Feature: Login as zinc user

  @admin
  Scenario: Login as zinc admin
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for admin user
    Then  I see homepage with site admin link in top bar

  @student
  Scenario: Login as a zinc student
     Given I open zinc page
     Then  I click on student login
     And   I enter username and password for student user
     Then  I see homepage for student user
     And   I do not see site admin link and admin button
