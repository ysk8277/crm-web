require 'sinatra'

get '/' do 
  @crm_app_name = "My CRM" # <%= %> use alligator tags to replace static name with ruby var.
  erb :index
end