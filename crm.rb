require_relative 'contact'

require 'sinatra'

get '/' do 
  @crm_app_name = "My CRM" # <%= %> use alligator tags to replace static name with ruby var.
  erb :index
end

get '/contacts' do
  @contacts = []
  @contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  @contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
  @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")

  erb :contacts   #Display all contacts
end

get '/contacts/add' do
  erb :add_contact 
end

get '/contacts/:id' do
  erb :contacts_by_attribute  #Display contacts by attribute
end

get '/contacts/:id/modify' do
  erb :modify_contact 
end