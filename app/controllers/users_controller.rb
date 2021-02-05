class UsersController < ApplicationController 

  get '/' do
    erb:home, :register => :'shows/list_shows'
  end

  get '/register' do
    if Helpers.is_logged_in?(session)
      redirect '/list_shows'
    else
    erb :'users/register'
    end
  end

  post '/register' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect to "users/register"
    end
      redirect to "shows/list_shows"
  end

  get '/login' do
    if Helpers.is_logged_in?(session)
      redirect to '/list_shows'
    end
    erb :'/users/login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
 
		if @user &&  @user.authenticate(params[:password])
      session[:user_id] = @user.id
		  redirect to "users/#{@user.id}"
    else
      redirect to 'users/login'
    end
  end

  # get '/users/:slug' do
  #   @user = User.find_by_slug(params[:slug])
  #   if !@user.nil?
  #     erb :'/users/show'
  #   else 
  #     redirect to '/login'
  #   end
  # end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    if !Helpers.is_logged_in?(session)
      redirect 'users/login'
    else

      erb :'/users/show'
    end 
  end

  get '/logout' do
      session.clear
      redirect '/'
  end
  
   



end
