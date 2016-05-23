require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/nation.rb')
require_relative('../models/event.rb')
require_relative('../models/participation.rb')





# get '/athletes' do

#   @athletes = Athlete.all
#   erb :'athletes/index'

# end

get '/participations' do

  @events = Event.all
  erb :'participations/index'

end



# get '/athletes/new' do

#   @nations = Nation.all
#   erb :'athletes/new'

# end



get '/participations/new' do

@athletes = Athlete.all
@events = Event.all
@participations = Participation.all
erb :'participations/new'

end



# post '/athletes' do
# # binding.pry
#   @athlete = Athlete.new(params)
#   @athlete.save
#   erb :'athletes/create'

# end

post '/participations' do

  @participation = Participation.new(params)
  @participation.save
  erb :'participations/create'

end



# get '/athletes/:id' do

#   @athlete = Athlete.find(params[:id])
#   @nation = Nation.find(@athlete.nation_id)
#   erb :'athletes/show'

# end



get '/participations/:id1/:id2' do

  @participation = Participation.find(params[:id1], params[:id2])
  erb :'participations/show'

end



# get '/athletes/:id/edit' do

#   @athlete = Athlete.find(params[:id])
#   @nation = Nation.find(@athlete.nation_id)
#   @nations = Nation.all
#   erb :'athletes/edit'

# end

get '/participations/:id1/:id2/edit' do

  @participation = Participation.find(params[:id1], params[:id2])
  @athlete = Athlete.find(params[:id1])
  @athletes = Athlete.all
  @event = Event.find(params[:id2])
  @events = Event.all
  erb :'participations/edit'

end



# put '/athletes/:id' do

#   @athlete = Athlete.update(params)
#   redirect to("/athletes/#{params['id']}")

# end

put '/participations/:id1/:id2' do
  binding.pry
  @participation = Participation.update(params)
  redirect to("/participations/#{params['athlete_id']}/#{params['event_id']}")

end



# delete '/athletes/:id' do  #add failsafe?

#   Athlete.delete(params[:id])
#   redirect to('/athletes')

# end






