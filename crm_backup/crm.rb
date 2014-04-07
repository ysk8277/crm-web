require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

@@rolodex = Rolodex.new       
@@rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar",""))

get '/' do      
  erb :index
end

get '/contacts' do            #Display all contacts
  erb :contacts   
end

get '/contacts/add' do
  erb :add_contact 
end

post '/contacts' do
  add_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes], params[:id])
  @@rolodex.add_contact(add_contact)
  redirect to ('/contacts')
end

get '/contacts/:id' do
  @contact = @@rolodex.find(params[:id].to_i)   #finding corresponding object
  if @contact
  erb :show_contact
  else 
  raise Sinatra::NotFound
  end
end
 
get '/contacts/:id/modify' do    
  @contact = @@rolodex.find(params[:id].to_i)  
  if @contact
    erb :modify_contact
  else
    raise Sinatra::NotFound 
  end
end

put "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:notes]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @@rolodex.remove_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

