require('pry-byebug')
require_relative('../models/nation.rb')



get '/nations' do
#INDEX
  @nations = Nation.all
  erb :'nations/index'

end


get '/nations/new' do
#NEW
  erb :'nations/new'

end 


post '/nations' do
#CREATE
  @nation = Nation.new(params)
  @nation.save
  erb :'nations/create'

end


get '/nations/:id' do
#SHOW
  @nation = Nation.find(params[:id])
  erb :'nations/show'

end


get '/nations/:id/edit' do
#EDIT
  @nation = Nation.find(params[:id])
  erb :'nations/edit'

end


put '/nations/:id' do
  binding.pry
#UPDATE
  @nation = Nation.update(params)
  redirect to("/nations/#{params['id']}")

end


delete '/nations/:id' do

  Nation.delete(params[:id])
  redirect to('/nations')

end












