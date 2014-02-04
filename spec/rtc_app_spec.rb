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
end
