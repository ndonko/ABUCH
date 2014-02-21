 #definition und installation von sinatra
 Sinatra ist eine DSL, die das schnelle Erstellen von Webanwendungen in Ruby mit minimalem Aufwand ermöglicht:
 `# myapp.rb
   require 'sinatra'
    get '/' do
    'Hallo Welt!'
  end `

# Sinatra RESTful Web Service

Just an experiment with Sinatra and DataMapper to make a RESTful/JSON web service.

## Install the application

`bundle install`

## Run the application

`shotgun app.rb`



### Testing with restclient 

Here are a couple of example REST requests using `RestClient`:

   restclient http://localhost:9393

     
## Routes

Here is the exhaustive list of entry points of the web service:

    

