Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :travels, only: [:new, :create, :index, :show] do
    resources :companies, only: [:new, :create, :index]
    resources :offers, only: [:new, :index, :create]
  end
  resources :offers, only: [:create]
  resources :companies, only: [:new, :create, :index]
  get '/companies/food', to: 'companies#food'
  get '/companies/technology', to: 'companies#technology'
  get '/companies/clothing', to: 'companies#clothing'
  get '/companies/auto', to: 'companies#auto'
  get '/companies/footwear', to: 'companies#footwear'
  get '/companies/drugstore', to: 'companies#drugstore'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


end
