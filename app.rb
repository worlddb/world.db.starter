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

  get '/countries(.:format)?' do
    Country.by_key.all    # sort/order by key
  end

  get '/cities(.:format)?' do
    City.by_key.all       # sort/order by key
  end

  get '/tag/:slug(.:format)?' do   # e.g. /tag/north_america.csv
    Tag.find_by!( slug: params['slug'] ).countries
  end


end # class StarterApp
