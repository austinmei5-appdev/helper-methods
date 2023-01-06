Rails.application.routes.draw do
  # get "/", controller: "movies", action: "index"
  # shorthand syntax for a route
  #get "/" => "movies#index"

  root "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies # index
  get "/movies/new" => "movies#new", as: :new_movie # new_movie_url and new_movie_path
          
  # READ
  get "/movies" => "movies#index" # already named
  get "/movies/:id" => "movies#show", as: :movie # singular, movie_path() expects an argument to populate :id segment
  
  # UPDATE
  patch "/movies/:id" => "movies#update" # already named
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie # edit_movie_path() expects an :id argument
  
  # DELETE
  delete "/movies/:id" => "movies#destroy" # already named

  #------------------------------
end
