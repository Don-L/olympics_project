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



get '/athletes/:id' do

  @athlete = Athlete.find(params[:id])
  @nation = Nation.find(@athlete.nation_id)
  erb :'athletes/show'

end



get '/athletes/:id/edit' do

  @athlete = Athlete.find(params[:id])
  @nation = Nation.find(@athlete.nation_id)
  @nations = Nation.all
  erb :'athletes/edit'

end



put '/athletes/:id' do

  @athlete = Athlete.update(params)
  redirect to("/athletes/#{params['id']}")

end



delete '/athletes/:id' do  #add failsafe?

  Athlete.delete(params[:id])
  redirect to('/athletes')

end






