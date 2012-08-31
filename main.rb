# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'mongo_mapper'
require 'pony'
require 'nokogiri'
require 'open-uri'
require './models/page'
require 'json'


TPMI_SMTP_OPTIONS = {
    :address        => "smtp.sendgrid.net",
    :port           => "587",
    :authentication => :plain,
    :user_name      => 'pesto',
    :password       => 'orangesend',
    :domain         => 'www.orangesend.com',
}
def send_email(to, subject, id)
  Pony.mail(:to => to, :from => 'OrangeSend <email@orangesend.com>',
    :subject => subject,
    :html_body => ("Here is a link to the that email page: www.orangesend.com/page?id=" + id),
    :via => :smtp, :via_options => TPMI_SMTP_OPTIONS
  )
end


get '/' do
  erb :home
end

get '/page' do
  o = Page.find(params[:id])
  "From: #{o.from}, Subject: #{o.subject}, Page: #{o.body.to_s}"
end
  
  
#right now using id for the url, might want to change this to a shortener  
post '/' do
 
  from = params[:from]
  subject = params[:subject]
  body = params[:html]
  charsets = params[:charsets]
  
  #doc = Nokogiri::HTML.parse(body)
  
  
  page_object = Page.create({
    :from => from,
    :subject => subject,
    :body => body
  })
  
  puts "*"*50
  puts "charsets " + charsets
  puts "*"*50
  
  x = page_object.save
  
  status 200
  
  email = JSON.parse(params[:envelope])['from']
  
  send_email(email, subject, page_object.id)
  
end

get '/all' do
  Page.all.map{|o| "From: #{o.from}, Subject: #{o.subject}"}.join("<br />")
end