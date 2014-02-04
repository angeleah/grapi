require 'rtc_app'
require 'spec_helper'
require 'rack/test'

set :environment, :test

describe "rtc_app" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "displays all the data" do
    get '/'
    expect(last_response).to be_ok
    User.all.each do |user|
      expect(last_response.body).to include(user.lastname)
      expect(last_response.body).to include(user.firstname)
    end
  end

  context "sorting" do
    it "by gender displaying females before males, then lastname ascending" do
      sorted_gender_markup = File.read(File.join( "spec", "fixtures", "sorted_by_gender.html"))
      get '/gender'
      expect(last_response).to be_ok
      expect(last_response.body).to match(sorted_gender_markup)
    end

    it "by birthdate, ascending" do
      sorted_birthdate_markup = File.read(File.join( "spec", "fixtures", "sorted_by_birthdate.html"))
      get '/birthdate'
      expect(last_response).to be_ok
      expect(last_response.body).to match(sorted_birthdate_markup)
    end

    it "by lastname, descending" do
      sorted_lastname_markup = File.read(File.join( "spec", "fixtures", "sorted_by_lastname.html"))
      get '/lastname'
      expect(last_response).to be_ok
      expect(last_response.body).to match(sorted_lastname_markup)
    end
  end
end
