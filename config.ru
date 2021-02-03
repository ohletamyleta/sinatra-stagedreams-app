require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#in order to send patch and delete requests:
use Rack::MethodOverride


#mount other controllers here with "use"
use UsersController
use ShowsController

run ApplicationController
