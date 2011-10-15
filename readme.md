* Ruby Conf Brazil 2011 - Tutorial 1
  Example of a Javascript MVC Applicacion with Spine(www.spinejs.com) Framework , a Rails 3.1 Application connected to MongoDB(www.mongodb.org)

* Pre-requisites
  Install and Run MongoDB. Instructions on their web-site(www.mongodb.org)

* MongoDB Configuration
  1. Add "mongomapper" and "bsonext" GEMS to your Gemfile
  1. Create a file name mongo.rb in config/initializers with the following code. (Change [APP-NAME] with your App's name)
  1. Add "include MongoMapper::Document" to your Models Classes
  1. Remember to add the Heroku Free HQ Resource to your App. (mongo.rb is configured to work with heroku)
  