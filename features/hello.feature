@functional
Feature: Introduction to gherkin

  @hello
  Scenario: Search google for Zinc Learning Labs
    Given I open google
    Then  I enter "Zinc Learning labs" in search box
    And   I press enter
    Then  I see "www.zinclearninglabs.com/" as first search result
