require 'active_record'

ENVIRONMENT ||= "development"

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "lib/db/#{ENVIRONMENT}_database.db"
)
