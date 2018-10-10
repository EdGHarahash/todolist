Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :things
  post "little_things/edit", to: "little_things#edit"
  post "little_things/create", to: "little_things#create"
  root to: "home#index"
end
