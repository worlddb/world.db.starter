

# ruby stdlibs

require 'pp'

# 3rd party libs/gems

require 'worlddb'
## require 'active_record'


ENV['RACK_ENV'] ||= 'development'

puts "ENV['RACK_ENV'] = #{ENV['RACK_ENV']}"

DB_CONFIG = {
  adapter:  'sqlite3',
  database: 'world.db'
}

puts "DB_CONFIG:"
pp DB_CONFIG
ActiveRecord::Base.establish_connection( DB_CONFIG )

# ActiveRecord::Base.logger = Logger.new( STDOUT )



## add lib to load path

$LOAD_PATH << "./lib"

require './lib/worlddb/service.rb'
