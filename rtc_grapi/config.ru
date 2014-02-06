$: << File.expand_path("./", File.dirname(__FILE__))
require "lib/rtc_grapi"

run Api.new
