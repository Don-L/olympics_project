require( 'sinatra' )
require('pg')
require( 'sinatra/contrib/all' )
require_relative('controllers/nations_controller')
require_relative('controllers/athletes_controller')
require_relative('controllers/events_controller')
require_relative('controllers/participations_controller')
require_relative('controllers/individual_event_results_controller.rb')
require_relative('controllers/team_event_results_controller.rb')
require_relative('models/analysis')


# get '/' do
#   @nations = Nation.all
#   erb :'homepage'
# end

get '/' do
  @table_rows = Analysis.nation_table_rows
  erb :'homepage'
end

# get '/' do

#   @rankings = Analysis.nation_rankings
#   erb :'homepage'

# end

# get '/' do

#   @nations = Analysis.nations_sorted_by_points
#   erb :'homepage'

# end