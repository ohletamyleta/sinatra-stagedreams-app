class ShowsController < ApplicationController


  get '/shows' do
    #redirect_if_not_logged_in
    @shows = Show.all
    erb :'shows/list_shows'
  end

  get '/shows/new' do
    redirect_if_not_logged_in
    @user = current_user
    erb :'/shows/new'
  end


  post '/shows' do
    redirect_if_not_logged_in
    @user = current_user
    if params[:title].empty?
         # flash[:errors] = "Something went wrong - all shows MUST have a title!" 
      redirect '/shows/new'
    else
      @show = Show.new(:title => params[:title],
        :author => params[:author],
        :role => params[:role],
        :style => params[:style],
        :composer => params[:composer],
        :year_done => params[:year_done],
        :theatre_company => params[:theatre_company],
        :notes => params[:notes])
        @show.user_id = @user.id
      @show.save
    # flash[:message] = "Show successfully created!" if @show.id
    redirect "/shows/#{@show.id}"
   
    end
  end

  get '/shows/:id' do
    # set_show
    #binding.pry
    @show = Show.find_by(id: params[:id])
  
    erb :'/shows/display_show'
  end

  get '/shows/:id/edit' do
    redirect_if_not_logged_in
    @show = Show.find(params[:id])
    if authorized_to_edit?(@show)
      erb :'/shows/edit_show'
    else 
      redirect "users/#{current_user.id}"
    end
  end

  patch '/shows/:id' do
    redirect_if_not_logged_in
    @show = Show.find(params[:id])
    if @show.user == current_user && params[:title] != "" 
      @show.update(:title => params[:title],
      :author => params[:author],
      :role => params[:role],
      :style => params[:style],
      :composer => params[:composer],
      :year_done => params[:year_done],
      :theatre_company => params[:theatre_company],
      :notes => params[:notes])
      @show.save
      redirect to '/shows/#{@show.id}'
    else
      redirect 'users/#{current_user.id}'
    end 
  end

  delete '/shows/:id' do
    @show = Show.find(params[:id])
    if authorized_to_edit?(@show)
      @show.delete
    #flash[:message] = "Now life has killed the dream I dreamed ~ Les Miserables"
     redirect '/shows/list_shows'
    else
      redirect '/shows/list_shows'
    end 
  end


  # private

  #   def set_show
  #       @show = Show.find(params[:id])
  #   end 
  
end
