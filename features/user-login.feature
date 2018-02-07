@functional
Feature: Login as zinc user

  @hello
  Scenario: Login as zinc admin
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for admin user
    Then  I see homepage with site admin link in top bar
