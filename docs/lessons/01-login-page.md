

# Lesson 01 : Automating login page for site admin user

<!--End to end tests works just like a real human** user, so the flow of test mimics a manual tester.-->

<!--**Choose a feature to test :** What happens when a user logs into the system-->

<!--**Various scenarios for testing this feature:** We need to think about what happens when-->

<!--site admin logs in-->

<!--student logs in-->

<!--teacher logs in-->

<!--school admin logs in-->

For this lesson, we choose the **scenario of a site admin logging into the system.**

Lets write down the **steps for testing this test if manually :** 

1. Go to homepage
2. Click on login
3. Enter user/password for site admin
4. Check if site admin link is visible on homepage





**Lets define this scenario in gherking language :** 

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

```ruby
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

What happened is cucumber tried to run the gherkin file but could not find the code that tells it how to run it. So cucumber suggested us to fill in the code.

Each of the block of code here is called a step definition. These step definition tell cucumber how to run the tests corresponding to a gherking file.

Lets copy this and paste it into a file in **features/steps/users.rb**

##### Opening a URL

Lets look at the first block of code, 

```ruby
Given(/^I open zinc homepage$/) do
  # open the browser window
end
```



Lets refer the cheatsheet here to figure out how to open the URL : 

```ruby
Given(/^I open zinc homepage$/) do
  @browser.goto("http://staging.zinclearninglabs.com/")
end

Then(/^I click on login$/) do
  sleep 5
end
```

In above code, we ask the cucumber to sleep for 5 seconds before

Now lets run the tests again to see what happens

```bash
rake tags=@admin
```

You should see the homepage opened up for 5 seconds.  

Next we need to click on the login link in the page, lets again quickly refer the cheatshee : 