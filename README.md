rtc - Reverb Developer Challenge
================================
This is a [technical challenge](http://reverb.com/page/dev-challenge) given by [Reverb](http://reverb.com/). This app uses the command line to import data and display data.

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
    - $ bin/rtc spec/fixtures/test_import_files/test.csv
    - $ bin/rtc spec/fixtures/test_import_files/test.psv
    - $ bin/rtc spec/fixtures/test_import_files/test.ssv

- To run the specs:
  + Follow the steps to Getting Started.
  + $ rspec
