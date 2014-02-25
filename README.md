Grapi - Use [Grape](https://github.com/intridea/grape) to access data that you have imported via the command line.
================================
This app is comprised of 2 parts.
- 1. A system to parse and sort a set of records. A command line app that takes as input a file with a set of records in one of three formats(.psv, .csv, .ssv) and outputs (to the screen) the set of records sorted in one of three ways.
- 2.A Grape API to access the system.

Usage:
------
- Getting started:
  + clone the app.
  + cd into the directory.
  + using ruby 2.1.0( if using rbenv and you don't have this ruby, after installing, $ gem install bundler)
  + $ bundle.

- To run the specs:
  + Follow the steps to Getting Started.
  + $ rspec

- Step 1: Import data. If this is the fist time running the app, the database will be empty.
  + Follow the steps to Getting Started.
  + To seed the app with data, you can feed it .csv, .psv, or .ssv files.
  + The data structure needs to be as follows. (where "," is either a "," "|" or " ")
    - Lastname, Firstname, Gender(male or female), FavoriteColor, DateOfBirth
  + There are test files located at spec/fixtures/test_import_files.  Run them to import the data if you do not have alternate files with the correct structure. Pass an optional sorting option (see below).  If no sorting option is passed, the program will return the data unsorted.
    - $ bin/grapi spec/fixtures/test_import_files/test.csv
    - $ bin/grapi spec/fixtures/test_import_files/test.psv
    - $ bin/grapi spec/fixtures/test_import_files/test.ssv
  + These files can be imported multiple times.  The program will combine the records and not import duplicate users.
  + You can pass arguments to sort the data as well.  To run the sorting..
    - Pass a file to process, as above, and then pass a sorting option.
      + The sorting options are gender, birthdate, and lastname.
        - gender (which will sort females before males, then by last name ascending.)
          + example: $ bin/grapi spec/fixtures/test_import_files/test.csv gender
        - birthdate (which will sort by birth date, ascending.)
          + example: $ bin/grapi spec/fixtures/test_import_files/test.psv birthdate
        - lastname (which will sort by last name, descending.)
          + example: $ bin/grapi spec/fixtures/test_import_files/test.ssv lastname

- Step 2: Run the Grape Api.
  + Follow the steps to Getting Started.
  + Follow the steps to Import data.
  + Use the shotgun command to start the server.
    - $ shotgun config.ru
    - The endpoints are as follows:
      + GET
        - localhost:9393/records/gender - returns records sorted by gender
        - localhost:9393/records/birthdate - returns records sorted by birthdate
        - localhost:9393/records/name - returns records sorted by name
      - Any other route will return "Not Found"
      + POST
        - localhost:9393/records - Post a single data line in any of the 3 formats supported by your existing code. (CSV, PSV, SSV)
        _ To post a record:
          + Make sure the server is running (shotgun config.ru)
          + Open a new terminal window but leave the server running.
          + Paste one of the examples below into the new terminal window or populate the data yourself.  The value for the record hash can be a single line of CSV, PSV, or SSV data.
          + Examples:
            - To post a CSV record:
              + curl  -H "Accept: application/json" -H "Content-type: application/json" 'http://localhost:9393/records' -d '{"record": "Person, Some, Female, Blue, 1981-02-17"}'
            - To post a PSV record:
              + curl  -H "Accept: application/json" -H "Content-type: application/json" 'http://localhost:9393/records' -d '{"record": "Guy | This | Male | Aqua | 1934-08-15"}'
            - To post a SSV record:
              + curl  -H "Accept: application/json" -H "Content-type: application/json" 'http://localhost:9393/records' -d '{"record": "Persons Soma Female Red 1961-02-17"}'
          + After using curl to POST, navigate back to any of the GET routes to see this new data displayed.
