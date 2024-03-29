require 'data_displayer'
require 'data_importer'
require 'db/schema'
require 'models/user'

class CliApplication

  def initialize(args = nil)
    if args.nil?
      invalid_input
    else
      @file = args[0]
      @sort_order = args[1]
      process_request
    end
  end

  def process_request
    if File.file?(@file)
      import
      sort_records
    else
      invalid_input
    end
  end

  def import
    DataImporter.new(@file)
  end

  def sort_records
    records = User.by_order(@sort_order)
    puts "#{ DataDisplayer.output(records) }"
  end

  def invalid_input
    puts "You must provide a filename with valid data to run this app."
  end
end
