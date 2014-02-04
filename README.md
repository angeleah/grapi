rtc - Reverb Developer Challenge
================================
This is a [technical challenge](http://reverb.com/page/dev-challenge) given by [Reverb](http://reverb.com/). This app uses the command line to import data and activerecord to interface with the database. This app then uses Sinatra to display the data in a browser window.

Usage:
------
- Getting started:
  + clone the app.
  + cd into the directory.
  + using ruby 2.1.0( if using rbenv and you don't have this ruby, after installing, $ gem install bundler)
  + $ bundle.

- To run the app:
  + Follow the steps to Getting Started.
  + To seed the app with data, you can feed it .csv, .psv, or .ssv files.
  + The data structure needs to be as follows. (where "," is either a "," "|" or " ")
    - Lastname, Firstname, Gender(male or female), FavoriteColor, DateOfBirth
  + There are test files located at spec/fixtures/test_import_files.  Run them to import the data if you do not have alternate files with the correct structure.
    - $ bin/process spec/fixtures/test_import_files/test.csv
    - $ bin/process spec/fixtures/test_import_files/test.psv
    - $ bin/process spec/fixtures/test_import_files/test.ssv
  + start the server with either shotgun or ruby.
    - To use shotgun,
      + $ shotgun rtc_app.rb
      + navigate to localhost:9393
    -  to run with ruby
      + $ ruby rtc_app.rb
      + navigate to localhost:4567

- To run the specs:
  + Follow the steps to Getting Started.
  + $ rspec
