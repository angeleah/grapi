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

- Step 1: Import data.
  + Follow the steps to Getting Started.
  + To seed the app with data, you can feed it .csv, .psv, or .ssv files.
  + The data structure needs to be as follows. (where "," is either a "," "|" or " ")
    - Lastname, Firstname, Gender(male or female), FavoriteColor, DateOfBirth
  + There are test files located at spec/fixtures/test_import_files.  Run them to import the data if you do not have alternate files with the correct structure.
    - $ bin/rtc spec/fixtures/test_import_files/test.csv
    - $ bin/rtc spec/fixtures/test_import_files/test.psv
    - $ bin/rtc spec/fixtures/test_import_files/test.ssv
  + You can pass arguments to sort the data as well.  To run the sorting..
    - Pass a file to process, as above, and then pass a sorting option.
      + The sorting options are...
        - gender (which will sort females before males, then by last name ascending.)
          + example: $ bin/rtc spec/fixtures/test_import_files/test.csv gender
        - birthdate (which will sort by birth date, ascending.)
          + example: $ bin/rtc spec/fixtures/test_import_files/test.psv birthdate
        - lastname (which will sort by last name, descending.)
          + example: $ bin/rtc spec/fixtures/test_import_files/test.ssv lastname

  + To run the specs:
    - Follow the steps to Getting Started.
    - $ rspec

- Step 2: Run the Grape Api.
  + Follow the steps to Getting Started.
  + Follow the steps to Import data.
  + Use the shotgun command to start the server.
    - $ shotgun config.ru
    - Navigate to localhost:9393
    - The endpoints are as follows:
      + POST localhost:9393/records - Post a single data line in any of the 3 formats supported by your existing code
      + GET localhost:9393/records/gender - returns records sorted by gender
      + GET localhost:9393/records/birthdate - returns records sorted by birthdate
      + GET localhost:9393/records/name - returns records sorted by name

