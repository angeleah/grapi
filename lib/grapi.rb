require 'grape'
require 'json'
require 'db/schema'
require 'models/user'
require 'data_importer'
require 'pry'

class Api < Grape::API
  format :json

  post :records do
    DataImporter.new(params[:record])
  end

  prefix 'records'

  desc "Returns records sorted by gender, (females before males) then by last name ascending."
  get :gender do
    User.by_gender.map(&:format).as_json
  end

  get :birthdate do
    User.by_birthdate_asc.map(&:format).as_json
  end

  get :name do
    User.by_lastname_desc.map(&:format).as_json
  end
end
