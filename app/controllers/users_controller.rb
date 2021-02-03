class UsersController < ApplicationController 

  get '/' do
    erb:home, :register => :'shows/list_shows'
  end

  get '/register' do
    if Helpers.is_logged_in?(session)
      redirect '/list_shows'
    else
    erb :'/users/register'
    end
  end

  post '/register' do
    if Helpers.is_logged_in?(session)
      redirect to '/list_shows'
    end
      if !(params.has_value?(""))
        @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/list_shows"
    else
      redirect to "/register"
    end
  erb :'shows/list_shows'
  end

  # get '/login' do

  # end

  # post '/login' do

  # end

  # get '/users/:slug' do

  # end

  # get '/logout' do

  # end
   



end
