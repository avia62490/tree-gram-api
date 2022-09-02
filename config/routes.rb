Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
############ USER/SESSION ###########
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

############# POSTS ##############
  get "/posts" => "posts#index"
  post "/posts" => "posts#create"
  get "/posts/:id" => "posts#show"
  patch "/posts/:id" => "posts#update"
  delete "posts/:id" => "posts#destroy"

############ COMMENTS ##############
  get "/comments" => "comments#index"
  post "/comments" => "comments#create"
  patch "/comments/:id" => "comments#update"
  delete "/comments/:id" => "comments#destroy"
end
