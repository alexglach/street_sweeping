Rails.application.routes.draw do

  root to: "searches#index"

  resources :searches
  resources :users
  resources :saved_streets
  resource :session, only: [ :new, :create, :destroy ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
