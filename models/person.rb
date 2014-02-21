class Person
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :vorname, String
  property :email, String
  property :handynummer, String
  property :plz, String
  property :strasse_und_hausnummer, String
 
  
  #has n, :contact



  #def to_s
  #  title
  #end

  def url
    "/persons/#{id}"
  end
end

