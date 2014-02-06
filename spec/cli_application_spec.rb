require 'spec_helper'
require 'cli_application'

describe CliApplication do

  let(:csv_file) { File.join( "spec", "fixtures", "test_import_files", "test.csv") }

  after do
    User.destroy_all
  end

  context "without a filename" do
    it "outputs help information" do
      STDOUT.should_receive(:puts).with("You must provide a filename with valid data to run this app.")
      CliApplication.new
    end
  end

  context "with an invalid file" do
    it "outputs help information" do
      STDOUT.should_receive(:puts).with("You must provide a filename with valid data to run this app.")
      CliApplication.new("cool/town")
    end
  end

  context "with a valid file" do
    context "without a sort order" do
      it "outputs all the records, unsorted" do
        STDOUT.should_receive(:puts).with("Einstein, Albert, Male, 03/14/1879, Green\nDarwin, Charles, Male, 02/12/1809, Blue\nCurie, Marie, Female, 11/07/1867, Yellow\nLovelace, Ada, Female, 12/10/1815, Purple\nTuring, Alan, Male, 06/03/1912, Green\n")
        CliApplication.new([csv_file])
      end
    end

    context "gender sort order" do
      it "outputs all the records sorted by gender,females before males, then lastname ascending" do
        sorted_gender_output = File.read(File.join( "spec", "fixtures", "sorted_by_gender.txt"))
        STDOUT.should_receive(:puts).with(sorted_gender_output)
        CliApplication.new([csv_file, "gender"])
      end
    end

    context "birthdate sort order" do
      it "outputs all the records sorted by birthdate, ascending" do
        sorted_birthdate_output = File.read(File.join( "spec", "fixtures", "sorted_by_birthdate.txt"))
        STDOUT.should_receive(:puts).with(sorted_birthdate_output)
        CliApplication.new([csv_file, "birthdate"])
      end
    end

    context "lastname sort order" do
      it "outputs all the records sorted by lastname, descending" do
        sorted_lastname_output = File.read(File.join( "spec", "fixtures", "sorted_by_lastname.txt"))
        STDOUT.should_receive(:puts).with(sorted_lastname_output)
        CliApplication.new([csv_file, "lastname"])
      end
    end
  end
end
