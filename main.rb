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

post '/' do
 
  params.each do |key, value|
    puts "-"*80
    puts "Key: #{key}"
    puts "-"*80
    puts "Value: #{value}"
    puts "*"*80
  end
  from = params[:from]
  subject = params[:subject]
  page = params[:html]
  
  page_object = Page.create({
    :from => from,
    :subject => subject
    #:page => page
  })
  
  page_object.save
  
  status 200
  
end

get '/all' do
  Page.all.map{|o| "From: #{o.from}, Subject: #{o.subject}"}.join("<br />")
end