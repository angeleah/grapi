require 'spec_helper'
require 'data_displayer'

describe DataDisplayer do

  let(:csv_file) { File.join( "spec", "fixtures", "test_import_files", "test.csv") }
  let(:psv_file) { File.join( "spec", "fixtures", "test_import_files", "test.psv") }
  let(:ssv_file) { File.join( "spec", "fixtures", "test_import_files", "test.ssv") }

  before do
    User.destroy_all
    DataImporter.new(csv_file).import_file
    DataImporter.new(psv_file).import_file
    DataImporter.new(ssv_file).import_file
  end

  context ".display_data" do
    it "displays the correct data formatted properly by gender" do
      sorted_gender_output = File.read(File.join( "spec", "fixtures", "sorted_by_gender.txt"))
      users = User.by_gender
      expect(DataDisplayer.output(users)).to eq(sorted_gender_output)
    end

    it "displays the correct data formatted properly by birthdate, ascending" do
      sorted_birthdate_output = File.read(File.join( "spec", "fixtures", "sorted_by_birthdate.txt"))
      users = User.by_birthdate_asc
      expect(DataDisplayer.output(users)).to eq(sorted_birthdate_output)
    end

    it "displays the correct data formatted properly by lastname, descending" do
      sorted_lastname_output = File.read(File.join( "spec", "fixtures", "sorted_by_lastname.txt"))
      users = User.by_lastname_desc
      expect(DataDisplayer.output(users)).to eq(sorted_lastname_output)
    end
  end
end
