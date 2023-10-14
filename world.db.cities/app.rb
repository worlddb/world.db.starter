# encoding: utf-8

##
# todo:
#  exclude metros n districts
#  only use city propers 

class CitiesApp < Sinatra::Base

include WorldDb::Models   ## (re)use world.db models

##############################################
# Controllers / Routing / Request Handlers

def fmt_number( num )
  ## format in blocks of three e.g.
  ##  1234567 becomes
  ##  1_234_567
  num.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\\1_').reverse
end

def link_to( title, href )
  "<a href='#{href}'>#{title}</a>"
end

def link_to_country( country )
  link_to( country.name, "/#{country.key}" )
end

def link_to_region( region )
  link_to( region.name, "/#{region.country.key}/#{region.key}" )
end

def link_to_continent( continent )
  link_to( continent.name, "/r/#{continent.key}" )
end


get '/' do
  erb :index, locals: { title:        'World',
                        cities:       City.by_pop,
                        cities_count: City.count,
                        nav: '' }
end

get '/r/:key' do |key|
  continent = Continent.find_by_key!( key )
  country_ids = continent.country_ids
  cities = City.where( country_id: country_ids )

  erb :index, locals: { title:  "#{continent.name}",
                        cities:       cities.by_pop,
                        cities_count: cities.count,
                        nav: '' }
end

get '/:country_key/:region_key' do |country_key,region_key|
  country = Country.find_by_key!( country_key )
  region  = Region.find_by_key_and_country_id!( region_key, country.id )

  nav = ''
  country.regions.by_title.each do |r|
    nav << link_to_region(r)
    nav << " <span class='city-count'>(#{r.cities.count})</span> "
  end

  erb :index, locals: { title: "#{region.name} › #{country.name} › #{country.continent.name}",
                        cities:       region.cities.by_pop,
                        cities_count: region.cities.count,
                        nav: nav }
end


get '/:key' do |key|
  country = Country.find_by_key!( key )

  nav = ''
  country.continent.countries.by_title.each do |c|
    nav << link_to_country(c)
    nav << " <span class='city-count'>(#{c.cities.count})</span> "
  end

  erb :index, locals: { title: "#{country.name} › #{country.continent.name}",
                        cities:       country.cities.by_pop,
                        cities_count: country.cities.count,
                        nav: nav }
end


end # class CitiesApp

