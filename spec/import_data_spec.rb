require "spec_helper"
require "script/import_data"

describe 'DataImporter' do

  let(:data_importer) { DataImporter.new(File.join("script", "import_files")) }
  let(:csv_file) { "script/import_files/test.csv" }
  let(:psv_file) { "script/import_files/test.psv" }
  let(:ssv_file) { "script/import_files/test.ssv" }

  it "reads a directory" do
    data_importer.read_directory.should match_array(["test.csv", "test.psv", "test.ssv"])
  end

  context "CSV" do
    it "gets the file separator" do
      data_importer.get_separator(csv_file).should == ","
    end

    it "processes the file" do
      data_importer.process_file(csv_file).should == "cool"
    end
  end

  context "PSV" do
    it "gets the file separator" do
      data_importer.get_separator(psv_file).should == "|"
    end

    it "processes the file" do
      data_importer.process_file(psv_file).should == "cool"
    end
  end

  context "SSV" do
    it "gets the file separator" do
      data_importer.get_separator(ssv_file).should == " "
    end

    it "processes the file" do
      data_importer.process_file(ssv_file).should == "cool"
    end
  end
end
