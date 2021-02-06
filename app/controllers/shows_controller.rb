class ShowsController < ApplicationController


  get '/list_shows' do
      @shows = Show.all
     erb :list_shows
  end

  get '/shows/new' do
    redirect_if_not_logged_in
    erb :'shows/new'
  end

  post '/shows/new' do
    redirect_if_not_logged_in
    if params[:title] != ""
      @show = Show.create(title: params[:title], author: params[:author], role: params[:role], style: params[:style], composer: [:composer],
              year_done: [:year_done], theatre_company: params[:theatre_company], notes: params[:notes])
      #flash[:message] = "Show successfully created!" if @show.id
      redirect '/shows/#{show.id}'
    else
      #flash[:errors] = "Something went wrong - all shows MUST have a title!"
      redirect '/shows/new'
    end
  end

  get 'shows/:id' do
    @show = Show.find_by_id(params[:id])
    erb :'/shows/display_show'
  end

  get 'shows/:id/edit' do
    redirect_if_not_logged_in
    @show = Show.find_by_id(params[:id])
    

  

  






end
