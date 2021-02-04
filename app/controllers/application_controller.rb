require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :home
  end

  helpers do 

      def current_user(session)
        @current_user ||= User.find_by(id: session[:user_id])
      end
    
      def self.is_logged_in?(session)
        !!current_user
      end
      
    
  end

end
