require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/nation.rb')





get '/athletes' do

  @athletes = Athlete.all
  erb :'athletes/index'

end



get '/athletes/new' do

  @nations = Nation.all
  erb :'athletes/new'

end



post '/athletes' do
# binding.pry
  @athlete = Athlete.new(params)
  @athlete.save
  erb :'athletes/create'

end


# get '/nations/:id' do
# #SHOW
#   @nation = Nation.find(params[:id])
#   erb :'nations/show'

# end

get '/athletes/:id' do

  @athlete = Athlete.find(params[:id])
  @nation = Nation.find(@athlete.nation_id)
  erb :'athletes/show'

end


# get '/nations/:id/edit' do
# #EDIT
#   @nation = Nation.find(params[:id])
#   erb :'nations/edit'

# end

get '/athletes/:id/edit' do

  @athlete = Athlete.find(params[:id])
  @nation = Nation.find(@athlete.nation_id)
  @nations = Nation.all
  erb :'athletes/edit'

end


# put '/nations/:id' do
#   binding.pry
# #UPDATE
#   @nation = Nation.update(params)
#   redirect to("/nations/#{params['id']}")

# end

put '/athletes/:id' do

  @athlete = Athlete.update(params)
  redirect to("/athletes/#{params['id']}")

end


# delete '/nations/:id' do

#   Nation.delete(params[:id])
#   redirect to('/nations')

# end


delete '/athletes/:id' do

  Athlete.delete(params[:id])
  redirect to('/athletes')

end






