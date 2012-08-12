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
