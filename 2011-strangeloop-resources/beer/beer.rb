require 'dm-core'
require 'dm-infinispan-adapter'

class Beer
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :rating, Integer
  property :notes, Text

  belongs_to :user
end

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :beers
end

DataMapper.setup(:default, :adapter=>'infinispan', :persist=>true)
DataMapper.finalize


