require( 'sinatra' )
require('pg')
require( 'sinatra/contrib/all' )
require_relative('controllers/nations_controller')
require_relative('controllers/athletes_controller')
require_relative('controllers/events_controller')
require_relative('controllers/participations_controller')
require_relative('controllers/individual_event_results_controller.rb')
require_relative('controllers/team_event_results_controller.rb')


get '/' do
  erb :'homepage'
end