require 'spec_helper'
require 'rtc_grapi'

describe Api do
  include Rack::Test::Methods

  def app
    Api
  end

  context "the Api" do

    before do
      User.create!()
    end

    it "GET/records/gender returns records sorted by gender" do

    end
  end
end
