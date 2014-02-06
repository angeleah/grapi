require 'csv'
require 'db/schema'
require 'models/user'

class FileImporter

  def initialize(file)
    @file = file
    import
  end

  def import
    separator = get_separator

    CSV.foreach(@file, {:col_sep => separator} ) do |row|
      User.find_or_create_by!(
        lastname: row[0].strip,
        firstname: row[1].strip,
        gender: row[2].strip,
        favorite_color: row[3].strip,
        birthdate: row[4].strip
      )
    end
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
