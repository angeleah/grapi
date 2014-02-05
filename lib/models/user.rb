require "active_record"

class User < ActiveRecord::Base

  def to_s
    "#{lastname}, #{firstname}, #{gender}, #{birthdate.strftime("%m/%d/%Y")}, #{favorite_color}"
  end

  def self.by_gender
    order(gender: :asc, lastname: :asc)
  end

  def self.by_birthdate_asc
    order(birthdate: :asc)
  end

  def self.by_lastname_desc
    order(lastname: :desc)
  end

  def self.by_order(order)
    case order
      when "gender"
        by_gender
      when "birthdate"
        by_birthdate_asc
      when "lastname"
        by_lastname_desc
      else
        all
      end
  end
end
