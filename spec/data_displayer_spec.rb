require 'spec_helper'
require 'data_displayer'
require 'data_importer'
require 'db/schema'
require 'models/user'

describe DataDisplayer do

  let(:csv_file) { File.join( "spec", "fixtures", "test_import_files", "test.csv") }
  let(:psv_file) { File.join( "spec", "fixtures", "test_import_files", "test.psv") }
  let(:ssv_file) { File.join( "spec", "fixtures", "test_import_files", "test.ssv") }

  before do
    FileImporter.new(csv_file)
    FileImporter.new(psv_file)
    FileImporter.new(ssv_file)
  end

  after do
    User.destroy_all
  end

  context ".display_data" do
    it "displays formatted data by gender, females before males, then lastname ascending" do
      sorted_gender_output = File.read(File.join( "spec", "fixtures", "sorted_by_gender.txt"))
      users = User.by_gender
      expect(DataDisplayer.output(users)).to eq(sorted_gender_output)
    end

    it "displays formatted data by birthdate, ascending" do
      sorted_birthdate_output = File.read(File.join( "spec", "fixtures", "sorted_by_birthdate.txt"))
      users = User.by_birthdate_asc
      expect(DataDisplayer.output(users)).to eq(sorted_birthdate_output)
    end

    it "displays formatted data by lastname, descending" do
      sorted_lastname_output = File.read(File.join( "spec", "fixtures", "sorted_by_lastname.txt"))
      users = User.by_lastname_desc
      expect(DataDisplayer.output(users)).to eq(sorted_lastname_output)
    end
  end
end
