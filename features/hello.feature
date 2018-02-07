@functional
Feature: Say hello

  @hello
  Scenario: Launch browser and open google.com
    Given I open google
    Then I enter "Zinc Learning labs" in search box
    And I press enter
    Then I see "www.zinclearninglabs.com/" as first search result
