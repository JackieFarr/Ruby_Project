require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/player.rb')
require_relative('../models/team.rb')
also_reload('../models/*')

## TEAMS LANDING PAGE ##
get ('/teams') do
  @teams = Team.all
  erb(:"teams/index")
end
