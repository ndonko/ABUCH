# Sinatra RESTful Web Service

Just an experiment with Sinatra and DataMapper to make a RESTful/JSON web service.

## Install the application

`bundle install`

## Run the application

`shotgun app.rb`



### Testing with restclient 

Here are a couple of example REST requests using `RestClient`:

   restclient http://localhost:4567

     > get '/persons'
     
     > get '/persons/2' => "{\"id\":3,\"first_name\":\"Basop\",\"last_name\":\"nana\"}" 
     
     > post "/persons/new", :first_name=>"lars", :last_name=>"bendal"
     
     > put "/persons/6", :first_name=>"lars", :last_name=>"bendel"
       error=> RestClient::InternalServerError: 500 Internal Server Error
       
     > delete "/persons/2/delete" => "{\"success\":\"OK\"}"
   
## Routes

Here is the exhaustive list of entry points of the web service:

    GET     "/persons"
    GET     "/persons/:id"
    POST    "/persons/new"
    PUT     "/persons/:id"
    DELETE  "/persons/:id/delete"

