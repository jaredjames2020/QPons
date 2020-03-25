Rails.application.routes.draw do
  root to: 'application#welcome'
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :travels, only: [:new, :create, :index, :show] do
    resources :companies, only: [:new, :create, :index]
    resources :offers, only: [:new, :index, :create]
  end

  resources :offers, only: [:create, :index]
  resources :companies, only: [:new, :create, :index]

  get '/companies/:category', to: 'companies#category'
  get '/travels/:category', to: 'travels#category'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

end
