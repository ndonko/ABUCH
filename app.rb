require 'sinatra'
#require 'sinatra/respond_to'
require 'json'
require 'data_mapper'
#require 'erb'


#################
# Configuration #
#################
Dir["./models/*.rb"].each { |model| require model }

configure :development do
  DataMapper.setup(:default, {
   :adapter  => 'mysql',
   :database  => 'person' ,  
   :username  => 'root',
   :password => "",
   :host     => '127.0.0.1'
})
end

set :json_encoder, :to_json  # To force json to simply call to_json on the object:
#set :show_exceptions, false

set :views, File.dirname(__FILE__) + "/views"


#######################
# RESTful application #
#######################



# GET-Methode: mit dieser methode werden daten abgerufen
get '/persone' do
   persone=Person.all
   persone.to_json
end


# Methode to create new information
post '/persone' do
   persone = Person.create! params  
  if persone.save
    persone.to_json
    {:success => "Daten gespeichert"}.to_json
    status 201   # Created
   else
    status 422   # Unprocessable Entity
   end
 
end


# zugrift auf bestimmte data
get '/persone/:id' do
   persone = Person.get(params[:id])
   if persone
    persone.to_json
   else
     halt 404 # Not Found
   end
end

# update von informationen
put "/persone/:id" do
    content_type :json
    persone=Person.get(params[:id])
    persone.update(:name => params[:name],
                   :vorname => params[:vorname],
                   :email => params[:email],
                   :handynummer => params[:handynummer],
                   :plz => params[:plz],
                   :strasse_und_hausnummer=> params[:strasse_und_hausnummer],
                  )
   
    persone.to_json
    {:success => "update gespeichert"}.to_json
 end



 
#DELETE: methode to delete persone
 delete '/persone/:id/delete' do
   content_type :json
   persone = Person.get(params[:id])
   
   if persone.destroy
     { :success => "Daten wurde geloescht" }.to_json
   else
     halt 500
   end
 end


DataMapper.auto_upgrade!
