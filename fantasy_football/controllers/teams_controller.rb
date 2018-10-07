require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/player.rb')
require_relative('../models/team.rb')
also_reload('../models/*')

## TEAMS LANDING PAGE ##
get ('/teams') do
  @teams = Player.all()
  erb(:"teams/index")
end
#
# ## NEW TEAM FORM ##
# get ('/teams/new') do
#   erb(:"teams/new")
# end

# CREATE Team ##
# post ('/teams') do
#   @team = Team.new(params)
#   @team.save()
#   erb(:"teams/create")
#   # redirect to ("/teams")
# end

# ## EDIT TEAM DETAILS - SHOWS FORM OF DETAILS ##
# get ('/teams/:id/edit') do
#   @team = Team.find(params[:id])
#   erb (:"teams/edit")
# end
#
# # UPDATE TEAMS DETAILS ##
# post ('/teams/:id') do
#   Team.new(params).update
#   redirect to ("/teams")
# end
#
# ## DELETE PLAYER ##
# post ('/teams/:id/delete') do
#   team = Team.find(params[:id])
#   team.delete
#   redirect to ("/teams")
# end
