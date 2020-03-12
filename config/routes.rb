Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :travels, only: [:new, :create, :index, :show] do
    resources :companies, only: [:new, :create, :index, :show]
    resources :offers, only: [:new, :index, :create]
  end
  resources :offers, only: [:create]
  resources :companies, only: [:new, :create, :index, :show]

end
