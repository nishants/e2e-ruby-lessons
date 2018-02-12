@users @functional
Feature: Login as zinc user

  @admin
  Scenario: Login as zinc admin
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for admin user
    Then  I see homepage with site admin link in top bar
    And   I can open admin section

  @student
  Scenario: Login as zinc student
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for student user
    Then  I see homepage without admin link in top bar
