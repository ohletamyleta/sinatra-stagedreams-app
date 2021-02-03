class UsersController < ApplicationController 

  get '/' do
    erb:home, :register => :'shows/list_shows'
  end

  get '/register' do

  end

  post '/register' do

  end

  



end
