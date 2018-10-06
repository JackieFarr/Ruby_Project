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

## SHOW PLAYER DETAILS ##
# get ('/players/:id') do
#   @player = Player.find(params[:id])
#   erb(:"players/show")
# end


# UPDATE PLAYER ##
# post ('/players/:id/update') do
#   @player = Player.new(params)
#   @player.update()
#   redirect to ('/players')
# end

## NEW PLAYER FORM ##
get ('/players/new') do
  erb(:"players/new")
end

# CREATE PLAYER ##
post ('/players/new') do
  @player = Player.new(params)
  @player.save
  redirect to ("/players")
end

## DELETE PLAYER ##
# post ('/players/:id/delete') do
#   Player.destroy(params[:id])
#   redirect to ("/players")
# end
