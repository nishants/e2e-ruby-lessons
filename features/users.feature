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
