require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/team.rb' )
require_relative( '../models/player.rb' )
also_reload( '../models/*' )

## PLAYERS LANDING PAGE ##
get ('/players') do
  @players = Player.all
  erb(:"players/index")
end
