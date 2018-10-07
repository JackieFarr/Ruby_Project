require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/team.rb' )
require_relative( '../models/player.rb' )
also_reload( '../models/*' )

## PLAYERS LANDING PAGE ##
get ('/players') do
  @players = Player.all()
  erb(:"players/index")
end

## NEW PLAYER FORM ##
get ('/players/new') do
  erb(:"players/new")
end

## CREATE PLAYER ##
post ('/players') do
  @player = Player.new(params)
  @player.save()
  erb(:"players/create")
  # redirect to ("/players")
end

## SHOW INDIV PLAYER DETAILS ##
get ('/players/:id') do
  @player = Player.find(params[:id].to_i)
  erb (:"players/show")
end

# UPDATE PLAYER DETAILS ##
post ('/players/:id') do
  Player.new(params).update
  redirect to 'players'
end

## EDIT PLAYER DETAILS - SHOWS FORM OF DETAILS ##
get ('/players/:id/edit') do
  @player = Player.find(params[:id].to_i)
  erb (:"players/edit")
end

## DELETE PLAYER ##
post ('/players/:id/delete') do
  player = Player.find(params[:id])
  player.delete
  redirect to ("/players")
end
