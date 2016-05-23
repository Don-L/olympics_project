require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/nation.rb')
require_relative('../models/event.rb')
require_relative('../models/participation.rb')
require_relative('../models/individual_event_result.rb')



# get '/participations' do

#   @events = Event.all
#   erb :'participations/index'

# end

get '/individual_event_results' do

  @individual_event_results = IndividualEventResult.all
  erb :'individual_event_results/index'

end



# get '/participations/new' do

# @athletes = Athlete.all
# @events = Event.all
# @participations = Participation.all
# erb :'participations/new'

# end


get '/individual_event_results/new' do

  @athletes = Athlete.all
  @events = Event.all

end



# post '/participations' do

#   @participation = Participation.new(params)
#   @participation.save
#   erb :'participations/create'

# end



# get '/participations/:id' do

#   @participation = Participation.find(params[:id])
#   erb :'participations/show'

# end



# get '/participations/:id/edit' do

#   @participation = Participation.find(params[:id])
#   @athlete = @participation.athlete
#   @athletes = Athlete.all
#   @event = @participation.event
#   @events = Event.all
#   erb :'participations/edit'

# end



# put '/participations/:id' do
#   # binding.pry
#   @participation = Participation.update(params)
#   redirect to("/participations/#{params['id']}")

# end



# delete '/participations/:id' do 

#   Participation.delete(params[:id])
#   redirect to('/participations')

# end






