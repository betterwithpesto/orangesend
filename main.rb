require 'rubygems'
require 'sinatra'
require 'mongo_mapper'
require 'pony'
require 'nokogiri'
require 'open-uri'
require './model'

get '/' do
  "Hello, World!"
end

post '/' do
 
  from = params[:from]
  subject = params[:subject]
  page = params[:html]
  
  page_object = Page.create({
    :from => from,
    :subject => subject,
    :page => page
  })
  
  page_object.save
  
end

get '/all'
  Page.all.each do |curPage|
    "Something happened. something good."
  end  
end