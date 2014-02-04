require 'spec_helper'
require 'script/import_data'

describe "DataImporter" do

  let(:data_importer) { DataImporter.new(File.join( "spec", "fixtures", "test_import_files")) }
  let(:csv_file) { File.join( "spec", "fixtures", "test_import_files", "test.csv") }
  let(:psv_file) { File.join( "spec", "fixtures", "test_import_files", "test.psv") }
  let(:ssv_file) { File.join( "spec", "fixtures", "test_import_files", "test.ssv") }

  before do
    User.destroy_all
  end

  it "reads a directory" do
    data_importer.read_directory.should match_array(["test.csv", "test.psv", "test.ssv"])
  end

  it "does not add duplicate records" do
    data_importer.process_file(csv_file)
    data_importer.process_file(psv_file)
    data_importer.process_file(ssv_file)
    User.all.count.should == 5
  end

  context ".file_separator" do
    it "works for CSV" do
      expect(data_importer.get_separator(csv_file)).to eq(",")
    end

    it "works for PSV" do
      expect(data_importer.get_separator(psv_file)).to eq("|")
    end

    it "works for SSV" do
      expect(data_importer.get_separator(ssv_file)).to eq(" ")
    end
  end

  context ".process_file" do
    it "processes a CSV" do
      expect {
        data_importer.process_file(csv_file)
        }.to change(User, :count).by(5)
    end

    it "processes a SSV" do
      expect {
        data_importer.process_file(ssv_file)
        }.to change(User, :count).by(5)
    end

    it "processes a PSV" do
      expect {
        data_importer.process_file(psv_file)
        }.to change(User, :count).by(5)
    end
  end
end
