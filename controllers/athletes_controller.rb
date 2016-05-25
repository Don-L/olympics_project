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
  @events = @athlete.events
  # @team_golds = Athlete.team_golds(@athlete.id)
  # @team_silvers = Athlete.team_golds(@athlete.id)
  # @team_bronzes = Athlete.team_golds(@athlete.id)
  # @ind_golds = Athlete.ind_golds(@athlete.id)
  # @ind_silvers = Athlete.ind_silvers(@athlete.id)
  # @ind_bronzes = Athlete.ind_bronzes(@athlete.id)
  @gold_results = Athlete.all_golds(@athlete.id, @athlete.nation_id)
  @silver_results = Athlete.all_silvers(@athlete.id, @athlete.nation_id)
  @bronze_results = Athlete.all_bronzes(@athlete.id, @athlete.nation_id)
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






