require "csv"

class DataImporter

  def read_directory(directory)
    Dir.entries(directory).reject { |file| file == "." || file == ".."}
  end

end
