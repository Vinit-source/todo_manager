Rails.application.routes.draw do
  # For details on the DSL available within this file,see https://https://guides.rubyonrails.org/routing.html

  # RESOURCE
  # Todo is a resource
  # - list of resources can be seen: index
  # - single resource can be seen: show
  # - create a new resource
  # These are some standard emthods required for every resource.
  # So rails provides default methods through resource routing (https://guides.rubyonrails.org/routing.html#resource-routing-the-rails-default)

  # get "todos", to: "todos#index"
  # post "todos", to: "todos#create"  # Rails convention for create method.
  # get "todos/:id", to: "todos#show"

  root to:"todos#index"
  # get "/", to: "index.html"
  resources :todos
  post "/users/login", to: "users#login"
  resources :users
end
