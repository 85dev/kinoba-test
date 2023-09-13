Rails.application.routes.draw do
  resources :users
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/movies/:id/potential_watchers', to: 'movies#potential_watchers'
end
