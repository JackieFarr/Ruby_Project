require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/team' )
require_relative( '../models/player' )
also_reload( '../models/*' )

## PLAYERS LANDING PAGE ##
get ('/players') do
  @players = Player.all
  erb(:"players/index")
end
