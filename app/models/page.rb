class Page 
  include MongoMapper::Document
  validates_presence_of :name
  
  key :name, String
  key :slug, String
  key :body, String

end