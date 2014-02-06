require 'file_importer'
require 'string_importer'

class DataImporter

  def initialize(data)
    if File.file?(File.expand_path(data))
      FileImporter.new(data)
    else
      StringImporter.new(data)
    end
  end
end
