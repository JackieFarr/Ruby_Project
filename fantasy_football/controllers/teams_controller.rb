require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/player.rb')
require_relative('../models/team.rb')
also_reload('../models/*')

## TEAMS LANDING PAGE ##
get ('/teams') do
  @teams = Team.all()
  erb(:"teams/index")
end
#
## NEW TEAM FORM ##
get ('/teams/new') do
  @teams = Team.all
  erb(:"teams/new")
end

## SHOW INDIV TEAM DETAILS ##
get ('/teams/:id') do
  # @players = Player.all()
  @players = Player.all
  @team = Team.find(params[:id].to_i)
  # @team.players
  erb (:"teams/show")
end

## CREATE TEAM ##
post ('/teams') do
  @team = Team.new(params)
  @team.save()
  erb(:"teams/create")
  # redirect to ("/teams")
end

## EDIT TEAM DETAILS - SHOWS FORM OF DETAILS ##
get ('/teams/:id/edit') do
  @teams = Team.all
  @team = Team.find(params[:id].to_i)
  erb (:"teams/edit")
end

## UPDATE TEAM DETAILS ##
post ('/teams/:id') do
  Team.new(params).update
  redirect to 'teams'
end

## DELETE TEAM ##
post ('/teams/:id/delete') do
  @team = Team.find(params[:id])
  @team.delete
  erb (:"teams/delete")
  # redirect to ("/teams")
end
