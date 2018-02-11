

**End to end tests works just like a real human** user, so the flow of test mimics a manual tester.

**Choose a feature to test :** What happens when a user logs into the system

**Various scenarios for testing this feature:** We need to think about what happens when

- site admin logs in
- student logs in
- teacher logs in
- school admin logs in


For this lesson, we choose the **scenario of a site admin logging into the system.**

Lets write down the **steps for testing this test if manually :** 

1. **Go to homepage**
2. **Click on login**
3. **Enter user/password for site admin**
4. **Check if site admin link is visible on homepage**





Now, we need to define this scenario in gherking language : 

```yaml
@users @functional
Feature: Login as zinc user

  @admin
  Scenario: Login as zinc admin
    Given I open zinc homepage
    Then  I click on login
    And   I enter username and password for admin user
    Then  I see homepage with site admin link in top bar
```

Lets save this file in features directory as **features/users.feature** 

Now lets go to console and run tests with command

 ````bash
rake tags=@admin
 ````

We get the following message on console : 

```yaml
You can implement step definitions for undefined steps with these snippets:

Given(/^I open zinc homepage$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I click on login$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I enter username and password for admin user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see homepage with site admin link in top bar$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

```

What happened is cucumber tried to run the gherking file but could not find the code that tells it what to run.

Lets copy this and paste it into a file in **features/steps/users.rb**

Each of the block of code here is called a step definition. These step definition tell cucumber how to run the tests corresponding to a gherking file.





