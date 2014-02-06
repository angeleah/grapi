require 'spec_helper'
require 'file_importer'

describe FileImporter do

  let(:csv_file) { File.join( "spec", "fixtures", "test_import_files", "test.csv") }
  let(:psv_file) { File.join( "spec", "fixtures", "test_import_files", "test.psv") }
  let(:ssv_file) { File.join( "spec", "fixtures", "test_import_files", "test.ssv") }

  after do
    User.destroy_all
  end

  it "does not add duplicate records" do
    FileImporter.new(csv_file)
    FileImporter.new(psv_file)
    FileImporter.new(ssv_file)
    User.all.count.should == 5
  end

  context ".file_separator" do
    it "works for CSV" do
      expect(FileImporter.new(csv_file).get_separator).to eq(",")
    end

    it "works for PSV" do
      expect(FileImporter.new(psv_file).get_separator).to eq("|")
    end

    it "works for SSV" do
      expect(FileImporter.new(ssv_file).get_separator).to eq(" ")
    end
  end

  context ".import" do
    it "processes a CSV" do
      expect {
        FileImporter.new(csv_file)
        }.to change(User, :count).by(5)
    end

    it "processes a SSV" do
      expect {
        FileImporter.new(ssv_file)
        }.to change(User, :count).by(5)
    end

    it "processes a PSV" do
      expect {
        FileImporter.new(psv_file)
        }.to change(User, :count).by(5)
    end
  end
end
