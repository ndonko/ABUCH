require 'sinatra'
require 'json'
require 'data_mapper'

#################
# Configuration #
#################

Dir["./models/*.rb"].each { |model| require model }

configure :development do
  #DataMapper.setup(:default, 'mysql://localhost')
  # DataMapper::Logger.new($stdout, :debug) # displays SQL queries
  DataMapper.setup(:default, {
   :adapter  => 'mysql',
   #:encoding => 'utf8',
   :database  => 'person' ,  
   :username  => 'root',
   :password => "",
   :host     => '127.0.0.1'
})
end
#configure :test do
#  DataMapper.setup(:default, 'sqlite::memory:')
#end
#DataMapper.finalize

set :json_encoder, :to_json
set :show_exceptions, false


#######################
# RESTful application #
#######################

# Returns all open services
get '/persons' do
  content_type :json
  persone=Person.all
  persone.to_json
end

# Creates a new service if valid
post '/persons/new' do
  persone = Person.create! params
  if persone.save
    persone.to_json
    { :success => "OK" }.to_json
    status 201
    response['Location'] = persone.url
  else
    status 422
    persone.errors.values.join
  end
end


get '/persons/:id' do
   content_type :json
   persone = Person.get(params[:id])
   
   if persone
     persone.to_json
   else
     halt 404
   end
end


# Updates a service if valid
put '/persons/:id' do
  content_type :json
  #persone = Person.get(params[:id])
   persone = Person.get(params[:id])
  persone.update(params[:persone]) 
   if persone.save
    persone.to_json
    #redirect "/persons/#{id}"
  else
    halt 500
    #redirect "/persons/#{id}/edit"
  end
 end
 
 #DELETE: route to delete persone
 delete '/persons/:id/delete' do
   content_type :json
   persone = Person.get(params[:id])
   
   if persone.destroy
     { :success => "OK" }.to_json
   else
     halt 500
   end
 end


DataMapper.auto_upgrade!
