
module WorldDB::Service

class Server < Sinatra::Base

  PUBLIC_FOLDER = "#{WorldDB::Service.root}/lib/worlddb/service/public"
  VIEWS_FOLDER  = "#{WorldDB::Service.root}/lib/worlddb/service/views"

  puts "[debug] worlddb-service - setting public folder to: #{PUBLIC_FOLDER}"
  puts "[debug] worlddb-service - setting views folder to: #{VIEWS_FOLDER}" 
  
  set :public_folder, PUBLIC_FOLDER   # set up the static dir (with images/js/css inside)   
  set :views,         VIEWS_FOLDER    # set up the views dir

  set :static, true   # set up static file routing

  #####################
  # Models

  include WorldDB::Models

  ##################
  # Helpers
  
    helpers do
      def path_prefix
        request.env['SCRIPT_NAME']
      end
    end 

##############################################
# Controllers / Routing / Request Handlers


get '/' do
  erb :index
end

get '/d*' do
  erb :debug
end

end # class Server


end #  module WorldDB::Service