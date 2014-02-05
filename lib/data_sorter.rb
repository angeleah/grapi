require 'csv'
require 'db/schema'
require 'models/user'


class DataSorter

  def self.by_gender
    User.order(gender: :asc, lastname: :asc)
  end

  def self.by_birthdate_asc
    User.order(birthdate: :asc)
  end

  def self.by_lastname_desc
    User.order(lastname: :desc)
  end
end

