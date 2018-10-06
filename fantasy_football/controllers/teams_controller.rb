require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/player.rb')
require_relative('../models/team.rb')
also_reload('../models/*')

## TEAMS LANDING PAGE ##
get ('/teams') do
  @teams = Team.all
  erb(:"teams/index")
end

## NEW TEAM FORM ##
get ('/teams/new') do
  erb(:"teams/new")
end

# CREATE TEAM ##
post ('/teams') do
  team = Team.new(params)
  team.save()
  redirect to ("/teams")
end
