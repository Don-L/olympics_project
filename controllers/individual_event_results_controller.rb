require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/nation.rb')
require_relative('../models/event.rb')
require_relative('../models/participation.rb')
require_relative('../models/individual_event_result.rb')



get '/individual_event_results' do

  @individual_event_results = IndividualEventResult.all
  erb :'individual_event_results/index'

end



get '/individual_event_results/new' do

  if params[:event] == nil
    @event = Event.all_individual.first
    @events = Event.all_individual
  else
    @event = Event.find(params[:event])
    @events = [@event]
  end
  @athletes = Participation.event_athletes(@event.id)
  erb :'individual_event_results/new'
end





post '/individual_event_results' do

  @result = IndividualEventResult.new(params).save
  @event = @result.event
  erb :'individual_event_results/create'

end



get '/individual_event_results/:id' do

  @result = IndividualEventResult.find(params[:id])
  @event = @result.event
  erb :'individual_event_results/show'

end



get '/individual_event_results/:id/edit' do

  @result = IndividualEventResult.find(params[:id])
  @event = @result.event
  @athletes = Participation.event_athletes(@event.id)
  @athlete1 = @result.ind_gold_medal_winner
  @athlete2 = @result.ind_silver_medal_winner
  @athlete3 = @result.ind_bronze_medal_winner
  @events = Event.all_individual
  erb :'individual_event_results/edit'

end



put '/individual_event_results/:id' do

  IndividualEventResult.update(params)
  redirect to("/individual_event_results/#{params['id']}")

end



delete '/individual_event_results/:id' do

  IndividualEventResult.delete(params[:id])
  redirect to('/individual_event_results')

end






