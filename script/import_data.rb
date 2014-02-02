require "csv"

class DataImporter

  def initialize(directory)
    @directory = directory
  end

  def read_directory
    Dir.foreach(@directory).reject { |file| file =~ /^\./}
  end

  def process_file(file)
    separator = get_separator(file)
    CSV.foreach( file, {:col_sep => separator} ) do |row|
      puts "lastname = #{ row[0]}"
      puts "firstname = #{ row[1]}"
      puts "gender = #{ row[2]}"
      puts "fav_color = #{ row[3]}"
      puts "birthdate = #{ row[4]}"
      return "cool"
    end
  end

  def get_separator(file)
    case File.extname(file)
    when ".csv"
      ","
    when ".psv"
      "|"
    when ".ssv"
      " "
    end
  end
end
