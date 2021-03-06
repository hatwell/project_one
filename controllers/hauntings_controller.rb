require( 'sinatra' )
require( 'pry' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
require_relative( '../models/ghost_type.rb' )
require_relative( '../models/ghost.rb' )
require_relative( '../models/haunting.rb' )
require_relative( '../models/location.rb' )
require_relative( '../models/location_type.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/service')
require_relative( '../models/neghostiation')

get '/hauntings' do
  @hauntings = Haunting.all
  erb(:all_hauntings)
end


get '/hauntings/new' do
  @ghost_types = GhostType.all()
  @location_types = LocationType.all()
  @customers = Customer.all()
  erb(:"hauntings/new_haunting")
end

get '/hauntings/:id' do
  @customers = Customer.all
  @haunting = Haunting.find(params['id'])
  erb(:"hauntings/haunting_details")
end

post('/hauntings') do
  # @ghost_types = GhostType.all()
  # @location_types = LocationType.all()
  # @customers = Customer.all()
  haunting = Haunting.new(params)
  location = Location.new(params)
  ghost = Ghost.new(params)
  haunting.save
  location.save
  ghost.save
  erb(:"hauntings/submission")
end

post '/hauntings/:id/delete' do
    @customers = Customer.all
    @haunting = Haunting.find(params['id'])
    @haunting.delete()
    erb(:"customers/index")

end
