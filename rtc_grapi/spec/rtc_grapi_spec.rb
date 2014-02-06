require 'spec_helper'
require 'rtc_grapi'

describe Api do
  include Rack::Test::Methods

  def app
    Api
  end
end
