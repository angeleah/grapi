require 'spec_helper'
require 'string_importer'

describe StringImporter do

  let(:csv) { "Dude, Cool, Male, Green, 1979-03-15" }
  let(:psv) { "Person | Another | Male | Blue | 1679-04-14" }
  let(:ssv) { "Vell Shane Female Orange 1919-11-03" }

  after do
    User.destroy_all
  end

  it "does not add duplicate records" do
    StringImporter.new(csv)
    StringImporter.new(psv)
    StringImporter.new(ssv)
    User.all.count.should == 3
  end

  context ".file_separator" do
    it "finds the correct column separator for CSV" do
      expect(StringImporter.new(csv).get_separator).to eq(",")
    end

    it "finds the correct column separator for PSV" do
      expect(StringImporter.new(psv).get_separator).to eq("|")
    end

    it "finds the correct column separator for SSV" do
      expect(StringImporter.new(ssv).get_separator).to eq(" ")
    end
  end

  context ".import" do
    it "imports the data from a CSV string" do
      expect {
        StringImporter.new(csv)
        }.to change(User, :count).by(1)
    end

    it "imports the data from a PSV string" do
      expect {
        StringImporter.new(psv)
        }.to change(User, :count).by(1)
    end

    it "imports the data from a SSV string" do
      expect {
        StringImporter.new(ssv)
        }.to change(User, :count).by(1)
    end
  end
end
