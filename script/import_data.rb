require "csv"
require "db/schema"
require "models/user"

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
      User.create!(
        lastname: row[0],
        firstname: row[1],
        gender: row[2],
        favorite_color: row[3],
        birthdate: row[4]
      )
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
