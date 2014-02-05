require 'spec_helper'
require 'models/user'
require 'data_importer'

describe User do

  context ".to_s" do
    before do
      User.destroy_all
      User.create!(lastname: "Einstein", firstname: "Albert", gender: "Male", favorite_color: "Green", birthdate: "1879-03-14")
      User.create!(lastname: "Lovelace", firstname: "Ada", gender: "Female", favorite_color: "Purple", birthdate: "1815-12-10")
    end

    it "returns the attributes as a string" do
      expect(User.first.to_s).to eq("Einstein, Albert, Male, 03/14/1879, Green")
      expect(User.last.to_s).to eq("Lovelace, Ada, Female, 12/10/1815, Purple")
    end
  end

  context ".sort" do

    let(:csv_file) { File.join( "spec", "fixtures", "test_import_files", "test.csv") }
    let(:psv_file) { File.join( "spec", "fixtures", "test_import_files", "test.psv") }
    let(:ssv_file) { File.join( "spec", "fixtures", "test_import_files", "test.ssv") }

    before do
      User.destroy_all
      DataImporter.new(csv_file).import_file
      DataImporter.new(psv_file).import_file
      DataImporter.new(ssv_file).import_file
    end

    it "by gender displaying females before males, then lastname ascending" do
      expect((User.by_gender)[0].firstname).to eq("Marie")
      expect((User.by_gender)[1].firstname).to eq("Ada")
      expect((User.by_gender)[2].firstname).to eq("Charles")
      expect((User.by_gender)[3].firstname).to eq("Albert")
      expect((User.by_gender)[4].firstname).to eq("Alan")
    end

    it "by birthdate, ascending" do
      expect((User.by_birthdate_asc)[0].firstname).to eq("Charles")
      expect((User.by_birthdate_asc)[1].firstname).to eq("Ada")
      expect((User.by_birthdate_asc)[2].firstname).to eq("Marie")
      expect((User.by_birthdate_asc)[3].firstname).to eq("Albert")
      expect((User.by_birthdate_asc)[4].firstname).to eq("Alan")
    end

    it "by lastname, descending" do
      expect((User.by_lastname_desc)[0].firstname).to eq("Alan")
      expect((User.by_lastname_desc)[1].firstname).to eq("Ada")
      expect((User.by_lastname_desc)[2].firstname).to eq("Albert")
      expect((User.by_lastname_desc)[3].firstname).to eq("Charles")
      expect((User.by_lastname_desc)[4].firstname).to eq("Marie")
    end
  end
end
