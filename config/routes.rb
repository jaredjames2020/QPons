Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :companies, only: [:new, :create, :index]
  resources :offers, only: [:new, :create, :index]
  resources :paths, only: [:new, :create, :index]

end
