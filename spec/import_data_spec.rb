require "spec_helper"
require "script/import_data"

describe 'DataImporter' do

  let(:data_importer) { DataImporter.new }

  it "reads a directory" do
    directory = "script/import_files"
    data_importer.read_directory(directory).should match_array(["test.csv", "test.psv", "test.ssv"])
  end
end
