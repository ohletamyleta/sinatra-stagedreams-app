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
      flash[:message] = "You have successfully created an account, #{@user.username}! Willkommen! And bienvenue! Welcome!
      Fremder, étranger, stranger! Glücklich zu sehen, Je suis enchanté, Happy to see you! Bleibe, reste, stay! Willkommen! And bienvenue! Welcome!"
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

      flash[:message] = "Welcome, #{@user.username}!"
		  redirect to "users/#{@user.id}"
    else
      flash[:errors] = "Your credentials were invalid.  Please sign up or try again." 
      redirect '/login'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    redirect_if_not_logged_in
    @quotes_array = ["Dreams come and they go, but hold them and keep them and know that you need them - Waitress",
    "Everybody's got dreams. I got plans. - Bonnie and Clyde",
    "Arise And Seize The Day! - Newsies",
    "I still have this faith in the truth of my dreams - Anastasia",
    "First, think. Second, dream. Third, believe. And finally, dare. - Walt Disney"]
    erb :'/users/show'
  end

  get '/logout' do
    flash[:message] = "You'll be back, soon you'll see..."
    session.clear
    redirect '/'
  end
  
   



end
