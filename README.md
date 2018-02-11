# Contents

1. [Setup](#setup)
2. [Gherkin](#gherkin)
3. [Cucumber](#cucumber)
4. [Webdriver](#webdriver)
5. Watir
6. Cheatsheet
7. Creating simple test
8. Using Page objects
9. User data with @users
10. Testing a listing page
11. Preparing test data
12. Running tests against Rails server on Semaphore
13. Cross browser Testing



# Setup

- Install chrome webdriver from https://sites.google.com/a/chromium.org/chromedriver/getting-started
- Install gems and run

```bash
bundle install
rake
```



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

Cucumber executes your `.feature` files, and those files contain executable specifications written in a language called Gherkin.

It maps each line from the gherkin file to a step written in ruby. This allows us to automate the specification written in gherking language using ruby (or any other language).



Example of above gherking file implementation with cucumber : 

```ruby
Given(/^I open zinc homepage$/) do
  @browser.goto "http://staging.zinclearninglabs.com/"
end


Then(/^I click on login$/) do
  @browser.element(:text => 'Login').click
end

And(/^I enter username and password for admin user$/) do
  @browser.text_field(:id => 'user_email').set('karthik.cs@gmail.com')
  @browser.text_field(:id => 'user_password').set('password')
  @browser.button(:text => 'Sign in').click
end

Then(/^I see homepage with site admin link in top bar$/) do
  site_admin_link = @browser.element(:text => '(Site Admin)')
  expect(site_admin_link.visible?).to eq(true)
end
```



# Webdriver

Refer : https://en.wikipedia.org/wiki/Selenium_(software)#Selenium_WebDriver

Selenium WebDriver accepts commands (sent in Selenese, or via a Client API) and sends them to a browser. This is implemented through a browser-specific browser driver, which sends commands to a browser, and retrieves results. Most browser drivers actually launch and access a browser application (such as [Firefox](https://en.wikipedia.org/wiki/Firefox), [Chrome](https://en.wikipedia.org/wiki/Google_Chrome), [Internet Explorer](https://en.wikipedia.org/wiki/Internet_Explorer), or [Microsoft Edge](https://en.wikipedia.org/wiki/Microsoft_Edge))



# Watir 

Refer: http://watir.com/

Watir is a pragrammer friendly ruby interface to Selenium Webdriver API. It provides more readable and concise code for interacting with elements on a webpage, while using Webdriver beneath the surface.



# Cheatsheet 

### Interacting with page elements

<u>Refer :  http://watir.com/guides/</u> 

| What                        | Example                                                      |
| :-------------------------- | ------------------------------------------------------------ |
| find by text and click      | @browser.element(:text => 'text-to-find').click              |
| check if element is visible | @browser.element(:text => 'text-to-find').visible?           |
| enter value in text field   | @browser.text_field(:id => 'my-input').set('my value')       |
| open URL                    | @browser.goto "http://my/url"                                |
| select a value              | @browser.select_list(:id => 'language').select 'English'     |
| all select options          | @browser.select_list(:id => 'language').selected_options     |
| radio button                | @browser.radio(:value => 'Optional').set                     |
| radio button value          | @browser.radio(:value => 'Optional').set?                    |
| checkbox                    | @browser.checkbox(:value => 'Optional').set                  |
| checkbox value              | @browser.checkbox(:value => 'Optional').set?                 |
| alert click 'Ok'            | @browser.alert.ok                                            |
| alert click 'Close'         | @browser.alert.close                                         |
| get alert text              | @browser.alert.text                                          |
| is alert shown              | @browser.alert.exists?                                       |
| wait for element            | @browser.element(:text => 'Submit').wait_until_present       |
| wait till element present   | @browser.element(:text => 'Loading').wait_while_present      |
| set default wait time       | @browser.driver.manage.timeouts.implicit_wait = 3 #in seconds |
| wait for condition          | Watir::Wait.until { @browser.element(:id => 'msg').text.include? 'Thank you' } |
|                             |                                                              |



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
