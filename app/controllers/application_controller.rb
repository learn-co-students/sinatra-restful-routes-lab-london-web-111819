class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    redirect to '/recipes'
  end

  # GET: /recipes/new
  get "/recipes/new" do
    erb :new
  end
  
  # POST: /recipes
  post "/recipes" do
      recipe = Recipe.create(params)
      # redirect "/doctors/#{doctor.id}" #TODO: Needed?
      redirect "/recipes"
  end
  
  # GET: /recipes/5
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end
  
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    # binding.pry
    erb :edit
  end

  # PATCH: /recipes/5
  patch "/recipes/:id/edit" do
    recipe = Recipe.find_by_id(params[:id])
    recipe.update(params[:recipe])
    redirect "/recipes/#{recipe.id}"
  end
  
  # DELETE: /recipes/5/delete
  delete "/recipes/:id/delete" do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect "/recipes"
  end

end