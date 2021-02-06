class UsersController < ApplicationController 

  get '/' do
    erb:home, :register => :'shows/list_shows'
  end

  get '/register' do
  redirect_if_logged_in
  erb :register
  end

  post '/register' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      #flash[:message] = "You have successfully created an account, #{@user.name}! Welcome!"
      redirect "/users/#{@user.id}"
    else
      flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
      redirect "/register"
    end
  end


  get '/login' do
    redirect_if_logged_in
    erb :login
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
 
		if @user &&  @user.authenticate(params[:password])
      session[:user_id] = @user.id

     # flash[:message] = "Welcome, #{@user.name}!"
		  redirect to "users/#{@user.id}"
    else
     # flash[:errors] = "Your credentials were invalid.  Please sign up or try again." 
      redirect '/login'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
      redirect_if_not_logged_in

      erb :'/users/show'
  end

  get '/logout' do
      session.clear
      redirect '/'
  end
  
   



end
