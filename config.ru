$: << File.expand_path("./lib", File.dirname(__FILE__))
require "grapi"

run Api.new
