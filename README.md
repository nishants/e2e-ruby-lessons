# Setup
- Install webdriver on path
- Run a bundle install



# Cheatsheet 

Webdriver + Watir

| What                        | Example                                                  |
| :-------------------------- | -------------------------------------------------------- |
| Find by text and click      | @browser.element(:text => 'text-to-find').click          |
| Check if element is visible | @browser.element(:text => 'text-to-find').click.visible? |
| Enter value in text field   | @browser.text_field(:id => 'my-input').set('my value')   |
| Open URL                    | @browser.goto "http://my/url"                            |



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
