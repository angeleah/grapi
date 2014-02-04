require './db/database_configuration'

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'users'
    create_table :users do |table|
    table.column :lastname, :string
    table.column :firstname, :string
    table.column :gender, :string
    table.column :favorite_color, :string
    table.column :birthdate, :date
   end
  end
end
