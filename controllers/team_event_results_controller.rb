require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/nation.rb')
require_relative('../models/event.rb')
require_relative('../models/participation.rb')
require_relative('../models/team_event_result.rb')



get '/team_event_results' do

  @team_event_results = TeamEventResult.all
  erb :'team_event_results/index'

end



#do same for individual event results new!



get '/team_event_results/new' do

  @nations = Nation.all
  @events = Event.all
  @event = @events.first #needed so page works
  erb :'team_event_results/new'

end

get '/team_event_results/new/' do #used when accessed from event show
  
  if params[:event] == nil
    @event = Event.all_team.first
    @nations = Nation.all
  else
    @event = Event.find(params[:event])
    @nations = Event.competing_nations(@event.id)
  end
  @events = Event.all_team
  erb :'team_event_results/new'
end


# get '/team_event_results/new?event=:id'



# end


# get 'team_event_results/new/' do  #experimental!
# binding.pry
#   # @event = Event.find(11)
#   @nations = Nation.all
#   @events = Event.all
#   erb :'team_event_results/new'

# end




post '/team_event_results' do

  @result = TeamEventResult.new(params).save
  @event = @result.event
  erb :'team_event_results/create'

end



get '/team_event_results/:id' do

  @result = TeamEventResult.find(params[:id])
  @event = @result.event
  erb :'team_event_results/show'

end



get '/team_event_results/:id/edit' do

  @result = TeamEventResult.find(params[:id])
  @event = @result.event
  @nations = Participation.nations(@event.id)
  @nation1 = @result.team_gold_medal_winner
  @nation2 = @result.team_silver_medal_winner
  @nation3 = @result.team_bronze_medal_winner
  @events = Event.all
  erb :'team_event_results/edit'

end



put '/team_event_results/:id' do

  TeamEventResult.update(params)
  redirect to("/team_event_results/#{params['id']}")

end



delete '/team_event_results/:id' do

  TeamEventResult.delete(params[:id])
  redirect to('/team_event_results')

end






