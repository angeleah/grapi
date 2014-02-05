require 'spec_helper'
require 'data_importer'

describe DataImporter do

  let(:csv_file) { File.join( "spec", "fixtures", "test_import_files", "test.csv") }
  let(:psv_file) { File.join( "spec", "fixtures", "test_import_files", "test.psv") }
  let(:ssv_file) { File.join( "spec", "fixtures", "test_import_files", "test.ssv") }

  after do
    User.destroy_all
  end

  it "does not add duplicate records" do
    DataImporter.new(csv_file).import_file
    DataImporter.new(psv_file).import_file
    DataImporter.new(ssv_file).import_file
    User.all.count.should == 5
  end

  context ".file_separator" do
    it "works for CSV" do
      expect(DataImporter.new(csv_file).get_separator).to eq(",")
    end

    it "works for PSV" do
      expect(DataImporter.new(psv_file).get_separator).to eq("|")
    end

    it "works for SSV" do
      expect(DataImporter.new(ssv_file).get_separator).to eq(" ")
    end
  end

  context ".import_file" do
    it "processes a CSV" do
      expect {
        DataImporter.new(csv_file).import_file
        }.to change(User, :count).by(5)
    end

    it "processes a SSV" do
      expect {
        DataImporter.new(ssv_file).import_file
        }.to change(User, :count).by(5)
    end

    it "processes a PSV" do
      expect {
        DataImporter.new(psv_file).import_file
        }.to change(User, :count).by(5)
    end
  end
end
