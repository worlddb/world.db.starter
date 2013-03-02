######
# NB: use rackup to startup Sinatra service (see config.ru)
#
#  e.g. config.ru:
#   require './boot'
#   run WorldDb::Service::Server


# 3rd party libs/gems

require 'sinatra/base'


# our own code

require 'worlddb/service/version'


module WorldDB::Service

  def self.banner
    "worlddb-service #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}] on Sinatra/#{Sinatra::VERSION} (#{ENV['RACK_ENV']})"
  end

### fix: move to WorldDB
  def self.root
    "#{File.expand_path( File.dirname(File.dirname(File.dirname(__FILE__))) )}"
  end

=begin  
  def self.config_path
    ## needed? use default db connection?
    "#{root}/config"
  end
=end

end #  module WorldDB

require 'worlddb/service/server'

# say hello
puts WorldDB::Service.banner
