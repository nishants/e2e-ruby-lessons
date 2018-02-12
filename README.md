# Contents

1. [Gherkin](#gherkin)
2. [Cucumber](#cucumber)
3. [Webdriver](#webdriver)
4. [Watir](#watir)
5. [Setup](#setup)
6. [Cheatsheet](https://github.com/nishants/zinc-test-lessons/blob/master/docs/cheat-sheet.md#cheatsheet)
7. [Creating simple test](https://github.com/nishants/zinc-test-lessons/blob/master/docs/lessons/01-login-page.md#lesson-01--automating-login-page-for-site-admin-user)
8. Using Page objects
9. User data with @users
10. Testing a listing page
11. Preparing test data
12. Semaphore Configuration
13. Cross browser Testing
14. Runtime options




# Gherkin

Gherkin is a language like **plain English** used to specify features of a system.

Gherkin serves two purposes — **documentation and automated tests**. 

Gherking allows **creating tests in collboration with non-technical stakeholders** in product (product owners, business team, manual testers).

**Example** : 

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

In Gherkin, each line that isn't blank has to start with a Gherkin *keyword*, followed by any text you like. The main keywords are:

- `Feature`
- `Scenario`
- `Given`, `When`, `Then`, `And`, `But` (Steps)
- `Background`
- `Scenario Outline`
- `Examples`

There are a few extra keywords as well:

- `"""` (Doc Strings)
- `|` (Data Tables)
- `@` (Tags)
- `#` (Comments)



# Cucumber

Cucumber executes the Gherkin files.

It maps each line from the gherkin file to a step written in ruby. This allows us to automate the specification written in gherking language using ruby (or any other language).

Example of above Gherkin step implementation with cucumber : 

```ruby
Given(/^I open zinc homepage$/) do
  @browser.goto "http://staging.zinclearninglabs.com/"
end


Then(/^I click on login$/) do
  @browser.element(:text => 'Login').click
end

And(/^I enter username and password for admin user$/) do
  @browser.text_field(:id => 'user_email').set('admin@mail.com')
  @browser.text_field(:id => 'user_password').set('admin-password')
  @browser.button(:text => 'Sign in').click
end

Then(/^I see homepage with site admin link in top bar$/) do
  site_admin_link = @browser.element(:text => '(Site Admin)')
  expect(site_admin_link.visible?).to eq(true)
end
```



# Webdriver

Refer : https://en.wikipedia.org/wiki/Selenium_(software)#Selenium_WebDriver

Selenium WebDriver accepts commands (via a Client API) and sends them to a browser. This is implemented through a browser-specific browser driver, which sends commands to a browser, and retrieves results. Most browser drivers actually launch and access a browser application (such as [Firefox](https://en.wikipedia.org/wiki/Firefox), [Chrome](https://en.wikipedia.org/wiki/Google_Chrome), [Internet Explorer](https://en.wikipedia.org/wiki/Internet_Explorer), or [Microsoft Edge](https://en.wikipedia.org/wiki/Microsoft_Edge))



# Watir 

Refer: http://watir.com/

Watir is a pragrammer friendly ruby interface to Selenium Webdriver API. It provides more readable and concise code for interacting with elements on a webpage, while using Webdriver beneath the surface.



# Setup

- Install chrome webdriver from https://sites.google.com/a/chromium.org/chromedriver/getting-started
- Git clone the repository 
- Open project directory
- Install gems 
- Run with rake command

```bash
git clone https://github.com/nishants/zinc-test-lessons.git
cd zinc-test-lessons
bundle install
rake
```



# Test a Login Page

[This tutorial helps you understand the basic building block of writting a tests.](https://github.com/nishants/zinc-test-lessons/blob/master/docs/lessons/01-login-page.md#lesson-01--automating-login-page-for-site-admin-user)



# Using Page objects

Making code maintanable by putting all web page related depdentices in page object layer.



# User data with @users

A DSL for organizing test data by features.



# Testing a listing page

Shows how to test a page that show a list of cards/table etc.



# Preparing test data

Load test data with rake command `db:play`, create data using UI or rails console, run `db:record` and checkin.



# Cheatsheet 

[Find a cheatsheet for quick reference to APIs here](https://github.com/nishants/zinc-test-lessons/blob/master/docs/cheat-sheet.md#cheatsheet)



# Semaphore Configuration

- Run rails server as daemon
- cd into e2e and run tests

![Semaphore Build](https://github.com/nishants/zinc-test-lessons/raw/master/docs/images/semaphore-build.png)



# Cross browser Testing

Watir supports all the leading browsers. The project is configured to allow selecting browser from command line (once driver for browser is added). Also the poject supports running chrome in emulator mode to test app on mobile, tablet browser screens.

The app also allows implementing the pages separately for mobile, desktop and tablets. Read runtime commands for more details.



# Runtime Options

```bash
rake [env=<env-name> | tags=<@tag1,@tag2> | device=<device-name> | pages=<path/to/pages> | data_suite=<name> | url=<url> | report_file=<path> | client=<device&browser> | users=<profiles-name> | ]
```

##### Examples

```bash
# Run articles and vocabulary tests
rake tags=@articles,@vocabulary

# Run all test and set environment to ci
rake env=ci 

# Run smoke tests on ci
rake tags=@smoke env=ci  

# Run articles and vocabulary tests for ci
rake tags=@articles,@vocabulary env=ci  
   
# Run tests on firefox
rake client=firefox 

# Run tests on chrome iphone emulator
rake client=iphone 

```
