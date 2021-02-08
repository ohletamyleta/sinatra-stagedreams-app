require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
    register Sinatra::Flash
    
  end

  get "/" do
    redirect_if_logged_in  
    erb :home
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized_to_edit?(show)
      show.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        #flash[:errors] = "You need a ticket for this performance!  Log in or register!"
        redirect '/'
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "/users/#{current_user.id}"
      end
    end

  end


end


