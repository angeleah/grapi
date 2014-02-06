require 'grape'
require 'json'
require 'db/schema'
require 'models/user'
require 'pry'

class Api < Grape::API
  format :json

  prefix 'records'

  desc "Returns records sorted by gender, (females before males) then by last name ascending."
  get :gender do
    User.by_gender.map(&:format).as_json
  end


end
