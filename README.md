# Setup
- Install webdriver on path
- Run a bundle install



# Cheatsheet 

### - Interacting with page elements

| What                        | Example                                                      |
| :-------------------------- | ------------------------------------------------------------ |
| Find by text and click      | @browser.element(:text => 'text-to-find').click              |
| Check if element is visible | @browser.element(:text => 'text-to-find').visible?           |
| Enter value in text field   | @browser.text_field(:id => 'my-input').set('my value')       |
| Open URL                    | @browser.goto "http://my/url"                                |
| Select a value              | @browser.select_list(:id => 'language').select 'English'     |
| All select options          | @browser.select_list(:id => 'language').selected_options     |
| Radio button                | @browser.radio(:value => 'Optional').set                     |
| Radio button value          | @browser.radio(:value => 'Optional').set?                    |
| Checkbox                    | @browser.checkbox(:value => 'Optional').set                  |
| Checkbox value              | @browser.checkbox(:value => 'Optional').set?                 |
| Alert click 'Ok'            | @browser.alert.ok                                            |
| Alert click 'Close'         | @browser.alert.close                                         |
| Get alert text              | @browser.alert.text                                          |
| Is alert shown              | @browser.alert.exists?                                       |
| Wait for element            | @browser.element(:text => 'Submit').wait_until_present       |
| Wait till element present   | @browser.element(:text => 'Loading').wait_while_present      |
| Set default wait time       | @browser.driver.manage.timeouts.implicit_wait = 3 #in seconds |
|                             |                                                              |
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
