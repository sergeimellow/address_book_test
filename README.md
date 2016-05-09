## Address book: ##
Basic Web based address book that allows users to login/register and create multiple address books. Each address book has its own list of contacts.
http://sergeimellow.com/address_book

## Requirements Met in **Bold** ##
* **listing/creating/editing/removing contacts and showing a single contact on it's own page**
* **exporting**/importing(not finished) contacts to/from a CSV file (overwrite contacts with the same full name on import)
* sharing contact details by email (in progress)
* **searching for contacts (optional, if you have time left)**
* **Each contact should have: first name**
* **last name**
* **multiple emails**
* **multiple phone numbers**
* **Each full name should be unique. Each contact should have at least one phone number or email.**

## Requirements: latest Rails and Ruby versions ##

* **first git commit right after rails new, other ones as you like**
* **Slim**, **Coffee**, **SASS**(very little, no time), **I18n**(index page, 1 header), Spec, **SQLite** (just for easy setup) or Postgres
* **server side model validations**
* **client side input validation for phone and email formats with CoffeeScript/jQuery** (very simple)
* no scaffolding, привет no Bootstrap, clean and simple design up to your taste


### Ruby / Rails versions:  
* ruby '2.3.1'
* gem 'rails', '4.2.6'

### To run Locally: ###
```
#!bash
git clone git@bitbucket.org:sergeim2/address_book_test.git
cd address_book_test
rvm install 2.3.1
rvm use 2.3.1
gem install bundler
bundle install
./db/development_recreate.sh
rails s
http://localhost:3000/
```

### Seed User  
* username:tester1@test.com
* password:tester1123