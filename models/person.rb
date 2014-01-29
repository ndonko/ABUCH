class Person
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  
 #has n, :comment

  def to_s
    title
  end

  def url
    "/persons/#{id}"
  end
end

