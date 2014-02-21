# definition und installation von sinatra
 
 Sinatra ist eine DSL, die das schnelle Erstellen von Webanwendungen in Ruby mit minimalem Aufwand ermöglicht:
 
 Einfach via Rubygems installieren und starten
 
 `gem install sinatra`
 
  `shotgun myapp`
 
 Mit shotgun muss man der server nicht ständig neu starten
 
 Die seite kann man unter  `http://localhost:9393` betrachten
 
# Datamapper installation

# Rest Web Services

# Verzeichniss structure des Adressbuch-Dienst

 ABUCH
     models
         person.rb
     views
         index.html.erb
  app.rb
  config.ru
  Gemfile
  Gemfile.lock
  README.md

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

    

