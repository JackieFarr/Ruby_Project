require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/players' )
also_reload( './models/*' )

## HOME LANDING PAGE ##
get ('/') do
  erb(:home)
end
