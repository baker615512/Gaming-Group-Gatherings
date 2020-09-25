Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/signup', to: 'gamers#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :gatherings
  resources :groups do
    resources :gatherings
  end
  resources :gamers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
