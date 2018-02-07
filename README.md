[![Build Status](https://semaphoreci.com/api/v1/projects/b63d0c77-ff6f-4c7c-b19b-1bbd3af19dc0/1765279/badge.svg)](https://semaphoreci.com/zinc/zinc-test)

## Setup
- install webdriver on path
- bundle install

## Sample Rake Commands
 
### Functional tests, Firefox, Dev machine, for specific feature
rake test:desktop:functional client=firefox tags=@accounts

### Readonly Integration tests, staging env
```bash
rake test:mobile:integration env=staging readonly=true
```

### Functional Smoke, for mobile web , on CI machine,
```bash
rake test::mobile:functional env=ci tags=@smoke
```

### Regression Integration, for big-web , on CI machine,
```bash
rake test:desktop:integration env=ci tags=@regression
```

### Integration tests, chrome iphone-5 emulator , CI machine
```bash
rake test:mobile:integration  env=ci  client=iphone5
```

### Options
```bash
rake command [env=<env-name> | device=<device-name> | pages=<path/to/pages> | data_suite=<name> | url=<url> | report_file=<path> | client=<device&browser> | users=<profiles-name> | ]
```
- example
```bash
rake test:functional:smoke:desktop env=ci  users=stubbed
rake test:functional:tag:desktop env=dev tags=@one users=stubbed url=google.com report_file=abc.html client=firefox data_suite=default page_dir=default 
   
```
