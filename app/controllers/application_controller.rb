class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do 
    recipy = Recipy.create(params)
  end

  get '/recipes/:id' do
    @recipy = Recipy.find(params[:id])
    erb :show 
  end

  get '/recipes/:id/edit' do 
    @recipy = Recipy.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do 
    @recipy = Recipy.find(params[:id])
    @recipy.update(params[:recipy])
    redirect "/recipes/#{@recipy.id}"
  end

  delete '/recipes/:id' do 
    recipy = Recipy.find(params[:id])
    recipy.destroy
    redirect "/recipes"
  end

end
