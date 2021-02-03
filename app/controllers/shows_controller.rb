class ShowsController < ApplicationController


  get '/list_shows' do
    if Helpers.is_logged_in?(session)
      @shows = Show.all
     erb :'shows/list_shows'
    else
  redirect to '/login'
  end
  end

  
get '/shows/new' do
  if !Helpers.is_logged_in?(session)
    redirect to '/login'
  end
  @user = Helpers.current_user(session)
  if @user.nil?
    redirect to '/login'
  else
    erb :'shows/new'
  end

  






end
