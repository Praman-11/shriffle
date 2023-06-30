Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users
  get "/login" , to: "users#login"
  post "/compare" , to: "users#compare"
  get "/welcome" , to: "users#welcome"
  get "/logout" , to: "users#logout"

  # get "/users/new" , to: "users#new"
end
