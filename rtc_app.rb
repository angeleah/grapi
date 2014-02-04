require 'sinatra'
require 'haml'
require './db/schema'
require './models/user'

get '/' do
  @users = User.all
  haml :index
end

get '/gender' do
  @users = User.order(gender: :asc, lastname: :asc)
  haml :index
end

get '/birthdate' do
  @users = User.order(birthdate: :asc)
  haml :index
end

get '/lastname' do
  @users = User.order(lastname: :desc)
  haml :index
end
