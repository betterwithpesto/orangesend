MongoMapper.connection = Mongo::Connection.new('alex.mongohq.com', 10054)
MongoMapper.database = 'orangesend'
MongoMapper.database.authenticate('orangesend','orangesend')

class Page
  include MongoMapper::Document
  key :page, String
  key :email, String

  timestamps!
end