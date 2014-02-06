require 'spec_helper'
require 'data_importer'
require 'file_importer'

describe DataImporter do

  let(:csv_file) { File.join( "spec", "fixtures", "test_import_files", "test.csv") }
  let(:psv_file) { File.join( "spec", "fixtures", "test_import_files", "test.psv") }
  let(:ssv_file) { File.join( "spec", "fixtures", "test_import_files", "test.ssv") }
  let(:csv_string) { "Dude, Cool, Male, Green, 1979-03-15" }
  let(:psv_string) { "Person | Another | Male | Blue | 1679-04-14" }
  let(:ssv_string) { "Vell Shane Female Orange 1919-11-03" }

  after do
    User.destroy_all
  end

  context "given files, DataImporter delegates to the FileImporter" do
    it "for CSV" do
      FileImporter.should_receive(:new).with(csv_file)
      DataImporter.new(csv_file)
    end

    it "for PSV" do
      FileImporter.should_receive(:new).with(psv_file)
      DataImporter.new(psv_file)
    end

    it "for SSV" do
      FileImporter.should_receive(:new).with(ssv_file)
      DataImporter.new(ssv_file)
    end
  end

  context "given strings, DataImporter delegates to the StringImporter" do
    it "for CSV" do
      StringImporter.should_receive(:new).with(csv_string)
      DataImporter.new(csv_string)
    end

    it "for PSV" do
      StringImporter.should_receive(:new).with(psv_string)
      DataImporter.new(psv_string)
    end

    it "for SSV" do
      StringImporter.should_receive(:new).with(ssv_string)
      DataImporter.new(ssv_string)
    end
  end
end
