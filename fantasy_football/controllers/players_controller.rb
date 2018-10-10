require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/team.rb' )
require_relative( '../models/player.rb' )
also_reload( '../models/*' )

## INDEX.ERB - PLAYERS LANDING PAGE ##
get ('/players') do
  @players = Player.all()
  erb(:"players/index")
end

## NEW.ERB - NEW PLAYER FORM ##
get ('/players/new') do
  @players = Player.all
  @teams = Team.all
  erb(:"players/new")
end

## SHOW.ERB - SHOW INDIV PLAYER DETAILS ##
get ('/players/:id') do
  @player = Player.find(params[:id].to_i)
  erb (:"players/show")
end

## CREATE.ERB - CREATED PLAYER ##
post ('/players') do
  @player = Player.new(params)
  @player.save()
  erb(:"players/create")
  # redirect to ("/players")
end

## EDIT.ERB - EDIT PLAYER DETAILS - SHOWS FORM OF DETAILS ##
get ('/players/:id/edit') do
  @teams = Team.all
  id = params[:id].to_i()
  @player = Player.find(id)
  erb (:"players/edit")
end

## UPDATE.ERB - UPDATED PLAYER DETAILS REDIRECTS ##
post ('/players/:id') do
  player = Player.new(params).update
  redirect to ("/players")
end

## DELETE.ERB -  DELETE PLAYER ##
post ('/players/:id/delete') do
  @player = Player.find(params[:id])
  @player.delete
  erb (:"players/delete")
end
