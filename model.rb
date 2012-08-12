MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com', 10092)
MongoMapper.database = 'sendwiki'
MongoMapper.database.authenticate('sendwiki','sendwiki')

class page
  include MongoMapper::Document
  key :page, String
  key :email, String

  timestamps!
end