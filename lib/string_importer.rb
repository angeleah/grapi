require 'csv'
require 'db/schema'
require 'models/user'

class StringImporter

  def initialize(data)
    @data = data
    import
  end

  def import
    separator = get_separator

    CSV.parse(@data, {:col_sep => separator} ) do |row|
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
    if @data.match(/\,/)
      ","
    elsif @data.match(/\|/)
      "|"
    else
      " "
    end
  end
end
