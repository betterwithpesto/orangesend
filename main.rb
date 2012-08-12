require 'rubygems'
require 'sinatra'
require 'mongo_mapper'
require 'pony'
require 'nokogiri'
require 'open-uri'
require './models/page'

get '/' do
  "Hello, World!"
end

get '/page' do
  o = Page.find(params[:id])
  "From: #{o.from}, Subject: #{o.subject}"
end
  
post '/' do
 
  from = params[:from]
  subject = params[:subject]
  page = params[:html]
  page_object = Page.create({
    :from => from,
    :subject => subject,
    :body => page
  })
  
  page_object.save
  
  status 200
  
end

get '/all' do
  Page.all.map{|o| "From: #{o.from}, Subject: #{o.subject}"}.join("<br />")
end