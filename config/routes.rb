Rails.application.routes.draw do
  get '/signup', to: 'gamers#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :gatherings
  resources :groups
  resources :gamers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
