require 'spec_helper'
require 'grapi'
require 'db/schema'
require 'models/user'

describe Api do
  include Rack::Test::Methods

  def app
    Api
  end

  context "the Api" do

    before do
      User.create!(lastname: "Einstein", firstname: "Albert", gender: "Male", favorite_color: "Green", birthdate: "1879-03-14" )
      User.create!(lastname: "Darwin" , firstname: "Charles", gender: "Male", favorite_color: "Blue", birthdate: "1809-02-12")
      User.create!(lastname: "Curie", firstname:"Marie", gender: "Female", favorite_color: "Yellow", birthdate: "1867-11-07")
      User.create!(lastname: "Lovelace", firstname: "Ada", gender: "Female", favorite_color: "Purple", birthdate: "1815-12-10")
      User.create!(lastname: "Turing", firstname: "Alan", gender: "Male", favorite_color: "Green", birthdate: "1912-06-03")
    end

    after do
      User.destroy_all
    end

    it "GET/records/gender returns records sorted by gender" do
      users_by_gender = User.by_gender
      get "/records/gender"
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq(users_by_gender.map(&:format).as_json)
    end

    it "GET/records/birthdate returns records sorted by birthdate" do
      users_by_birthdate = User.by_birthdate_asc
      get "/records/birthdate"
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq(users_by_birthdate.map(&:format).as_json)
    end

    it "GET/records/name returns records sorted by name" do
      users_by_name = User.by_lastname_desc
      get "/records/name"
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq(users_by_name.map(&:format).as_json)
    end

    context "POST" do
      it "POST/records allows a single data line in CSV format" do |variable|
        post "/records", { record: "Person, Some, Female, Red, 1901-02-17" }
        expect(last_response.status).to eq(201)
        expect(User.all.last.format).to eq(lastname: "Person" , firstname: "Some", gender: "Female", favorite_color: "Red", birthdate: "02/17/1901")
      end
    end
  end
end
