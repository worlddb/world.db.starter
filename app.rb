# encoding: utf-8

######
# note: to run use
#
#    $ ruby ./server.rb


class StarterApp < Webservice::Base

  #####################
  # Models

  include WorldDb::Models


  ##############################################
  # Controllers / Routing / Request Handlers

  get '/' do
    'Hello, World!'
  end

end # class StarterApp
