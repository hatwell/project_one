require('pg')
require('pry-byebug')
require_relative('../models/customer')
require_relative('../models/ghost_type')
require_relative('../models/haunting')
require_relative('../models/investigator')
require_relative('../models/location_type')
require_relative('../models/ghost')
require_relative('../models/location')
require_relative('../models/neghostiation')
require_relative('../models/person')
require_relative('../models/service')

LocationType.delete_all()
location_types = ['educational building', 'office building', 'home', 'shop', 'hospital', 'municipal building', 'outdoors', 'historical site', 'religious building']
location_types.sort!
location_types.each do |location_type|
    newLocationType = LocationType.new({
    'name' => location_type
    })
    newLocationType.save
    end


GhostType.delete_all()
ghost_types = ['spirit', 'ghoul', 'incubus', 'succubus', 'poltergheist', 'banshee', 'haint', 'demon', 'traditional ghost', 'wisp', 'egg ghost']
ghost_types.sort!
ghost_types.each do |ghost_type|
    newGhostType = GhostType.new({
    'name' => ghost_type
    })
    newGhostType.save
    end


Service.delete_all()
services = ['exorcism', 'sage-burning', 'ouija board', 'energy cleansing', 'capture and release']
services.sort!
services.each do |service|
    newService = Service.new({
    'name' => service
    })
    newService.save
    end

Customer.delete_all()
customers = ['kevin', 'lebron', 'kyrie', 'tristan', 'klay']
customers.sort!
customers.each do |customer|
    newCustomer = Customer.new({
    'name' => customer,
    'email_address' => customer + "@gmail.com"
    })
    newCustomer.save
    end

Location.delete_all()
locations = ['Leith Walk Tesco', 'Carolines Flat', 'Edinbugh Castle', 'CodeClan', 'Westminster Abbey']
locations.sort!
locations.each do |location|
    newLocation = Location.new({
    'name' => location,
    'location_type_id' => LocationType.all.sample.id
    })
    newLocation.save
    end


Ghost.delete_all()
ghosts = ['Spooky Jim', 'The Leith Poltergheist', 'Old Mary', 'Black Spectre', 'the ghost of a dog']
ghosts.sort!
ghosts.each do |ghost|
    newGhost = Ghost.new({
    'name' => ghost,
    'ghost_type_id' => GhostType.all.sample.id
    })
    newGhost.save
    end


Haunting.delete_all()

haunting1 = Haunting.new ({
  'haunting_date' => '04/04/2015',
  'haunting_description' => 'it was very spooky',
  'ghost_name' => 'spooky david',
  'ghost_type_id' => GhostType.all.sample.id,
  'customer_id' => Customer.all.sample.id
})
haunting1.save()

investigator1 = Investigator.new({
  'name' => 'Caroline Hatwell',
  'email_address' => 'caroline.hatwell@gmail.com'
  })

investigator1.save()

neghostiation1 = Neghostiation.new({
  'neghostiation_date' => '10/04/2016',
  'investigator_id' => investigator1.id,
  'haunting_id' => haunting1.id,
  'services_id' => Service.all.sample.id,
  'report' => 'the ghost is still there',
  'successful' => false
  })

  neghostiation1.save()


binding.pry
nil
