require 'spec_helper'
require 'data_sorter'
require 'data_importer'

describe DataSorter do

  let(:csv_file) { File.join( "spec", "fixtures", "test_import_files", "test.csv") }
  let(:psv_file) { File.join( "spec", "fixtures", "test_import_files", "test.psv") }
  let(:ssv_file) { File.join( "spec", "fixtures", "test_import_files", "test.ssv") }

  before(:all) do
    DataImporter.new(csv_file).import_file
    DataImporter.new(psv_file).import_file
    DataImporter.new(ssv_file).import_file
  end

  context ".sort" do
    it "by gender displaying females before males, then lastname ascending" do
      expect((DataSorter.by_gender)[0].firstname).to eq("Marie")
      expect((DataSorter.by_gender)[1].firstname).to eq("Ada")
      expect((DataSorter.by_gender)[2].firstname).to eq("Charles")
      expect((DataSorter.by_gender)[3].firstname).to eq("Albert")
      expect((DataSorter.by_gender)[4].firstname).to eq("Alan")
    end

    it "by birthdate, ascending" do
      expect((DataSorter.by_birthdate_asc)[0].firstname).to eq("Charles")
      expect((DataSorter.by_birthdate_asc)[1].firstname).to eq("Ada")
      expect((DataSorter.by_birthdate_asc)[2].firstname).to eq("Marie")
      expect((DataSorter.by_birthdate_asc)[3].firstname).to eq("Albert")
      expect((DataSorter.by_birthdate_asc)[4].firstname).to eq("Alan")
    end

    it "by lastname, descending" do
      expect((DataSorter.by_lastname_desc)[0].firstname).to eq("Alan")
      expect((DataSorter.by_lastname_desc)[1].firstname).to eq("Ada")
      expect((DataSorter.by_lastname_desc)[2].firstname).to eq("Albert")
      expect((DataSorter.by_lastname_desc)[3].firstname).to eq("Charles")
      expect((DataSorter.by_lastname_desc)[4].firstname).to eq("Marie")
    end
  end
end
