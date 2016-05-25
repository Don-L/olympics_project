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
  @gold_results = Nation.all_gold_results(@nation.id)
  @silver_results = Nation.all_silver_results(@nation.id)
  @bronze_results = Nation.all_bronze_results(@nation.id)
  @events = Nation.all_events(@nation.id)
  @athletes = Nation.all_athletes(@nation.id)
  # binding.pry
  erb :'nations/show'

end


get '/nations/:id/edit' do
#EDIT
  @nation = Nation.find(params[:id])
  erb :'nations/edit'

end


put '/nations/:id' do
#UPDATE
  @nation = Nation.update(params)
  redirect to("/nations/#{params['id']}")

end


delete '/nations/:id' do

  Nation.delete(params[:id])
  redirect to('/nations')

end












