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

  get '/login' do
    if Helpers.is_logged_in?(session)
      redirect to '/list_shows'
    end
    erb :'/users/login'
  end

  post '/login' do
  @user = User.find_by(:username => params[:username])

		  if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
		  redirect to "/list_shows"
  else
    redirect to '/login'
  end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if !@user.nil?
      erb :'/users/show'
    else 
      redirect to '/login'
    end
  end

  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
      else
        redirect to '/'
      end
      redirect to '/login'
  end
   



end
