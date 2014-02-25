require 'csv'
require 'db/schema'
require 'models/user'
require 'file_importer'

class FileImporter

  def initialize(file)
    @file = file
    import
  end

  def import
    separator = get_separator
    StringImporter.new(File.read(@file))
  end

  def get_separator
    case File.extname(@file)
    when ".csv"
      ","
    when ".psv"
      "|"
    when ".ssv"
      " "
    end
  end
end
