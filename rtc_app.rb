require 'sinatra'
require 'haml'
require './db/schema'
require './models/user'

get '/' do
  @users = User.all
  haml :index
end
