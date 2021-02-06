class ShowsController < ApplicationController


  get '/list_shows' do
      @shows = Show.all
     erb :'shows/list_shows'
  end

  get '/shows/new' do
    redirect_if_not_logged_in
    erb :'shows/new'
  end

  

  






end
