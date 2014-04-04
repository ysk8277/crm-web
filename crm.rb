require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

@@rolodex = Rolodex.new       #define class variable @@ to access Rolodex

@@rolodex.create_contact(Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder", ""))

get '/' do 
  @crm_app_name = "C.R.M"     #<%= %> use alligator tags to replace static name with ruby var.
  erb :index
end

get '/contacts' do            #Display all contacts
  erb :contacts   
end

get '/contacts/add' do
  erb :add_contact 
end

get '/contacts/:id' do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
  erb :show_contact
  else 
    raise Sinatra::NotFound
  end
end  

get '/contacts/:id/modify' do
  erb :modify_contact 
end

post '/contacts' do
  add_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes], params[:id])
  @@rolodex.create_contact(add_contact)
  redirect to ('/contacts')
end
