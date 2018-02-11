# Setup
- Install webdriver on path
- Run a bundle install



# Cheatsheet 

### - Interacting with page elements

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
rake command [env=<env-name> | device=<device-name> | pages=<path/to/pages> | data_suite=<name> | url=<url> | report_file=<path> | client=<device&browser> | users=<profiles-name> | ]
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
