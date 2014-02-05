require "active_record"

class User < ActiveRecord::Base

  def to_s
    "#{lastname}, #{firstname}, #{gender}, #{birthdate.strftime("%m/%d/%Y")}, #{favorite_color}"
  end
end
