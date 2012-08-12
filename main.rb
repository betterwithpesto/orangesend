# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'mongo_mapper'
require 'pony'
require 'nokogiri'
require 'open-uri'
require './models/page'

=begin
TPMI_SMTP_OPTIONS = {
    :address        => "smtp.sendgrid.net",
    :port           => "587",
    :authentication => :plain,
    :user_name      => 'patlu08@gmail.com',
    :password       => 'orangesend',
    :domain         => 'www.orangesend.com',
}
def send_email(to, subject, html_body, id)
  Pony.mail(:to => to, :from => 'OrangeSend <email@orangesend.com>',
    :subject => subject,
    :html_body => "Here is a link to the that email page: ",
    :via => :smtp, :via_options => TPMI_SMTP_OPTIONS
  )
end
=end

get '/' do
  "Hello, World!"
end

get '/page' do
  o = Page.find(params[:id])
  "From: #{o.from}, Subject: #{o.subject}, Page: #{o.page.to_s}"
end
  
  
#right now using id for the url, might want to change this to a shortener  
post '/' do
 
  from = params[:from]
  subject = params[:subject]
  body = params[:html]
  
  page_object = Page.create({
    :from => from,
    :subject => subject,
    :body => body
  })
  
  page_object.save
  
  status 200
  
  #send_email(from, subject.text, )
  
end

get '/all' do
  Page.all.map{|o| "From: #{o.from}, Subject: #{o.subject}"}.join("<br />")
end