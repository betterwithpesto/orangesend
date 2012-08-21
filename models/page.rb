# encoding: UTF-8
MongoMapper.connection = Mongo::Connection.new('alex.mongohq.com', 10054)
MongoMapper.database = 'orangesend'
MongoMapper.database.authenticate('orangesend','orangesend')

class Page
  include MongoMapper::Document
  key :from, String
  key :subject, String
  key :body, Binary

  timestamps!
end