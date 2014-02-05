require 'spec_helper'
require 'models/user'


describe User do

  before(:all) do
    User.create!(lastname: "Einstein", firstname: "Albert", gender: "Male", favorite_color: "Green", birthdate: "1879-03-14")
    User.create!(lastname: "Lovelace", firstname: "Ada", gender: "Female", favorite_color: "Purple", birthdate: "1815-12-10")
  end

  context ".to_s" do
    it "returns the attributes as a string" do
      expect(User.first.to_s).to eq("Einstein, Albert, Male, 03/14/1879, Green")
      expect(User.last.to_s).to eq("Lovelace, Ada, Female, 12/10/1815, Purple")
    end
  end
end
