require "spec_helper"
require "script/import_data"

describe 'DataImporter' do

  let(:data_importer) { DataImporter.new(File.join("script", "import_files")) }
  let(:csv_file) { "script/import_files/test.csv" }
  let(:psv_file) { "script/import_files/test.psv" }
  let(:ssv_file) { "script/import_files/test.ssv" }

  after do
    User.destroy_all
  end

  #TODO: add new feature that accounts for duplicate entries

  it "reads a directory" do
    data_importer.read_directory.should match_array(["test.csv", "test.psv", "test.ssv"])
  end

  context "CSV" do
    it "gets the file separator" do
      data_importer.get_separator(csv_file).should == ","
    end

    it "processes the file" do
      expect {
        data_importer.process_file(csv_file)
        }.to change(User, :count).by(5)
    end
  end

  context "PSV" do
    it "gets the file separator" do
      data_importer.get_separator(psv_file).should == "|"
    end

    it "processes the file" do
      expect {
        data_importer.process_file(psv_file)
        }.to change(User, :count).by(5)
    end
  end

  context "SSV" do
    it "gets the file separator" do
      data_importer.get_separator(ssv_file).should == " "
    end

    it "processes the file" do
      expect {
        data_importer.process_file(ssv_file)
        }.to change(User, :count).by(5)
    end
  end
end
