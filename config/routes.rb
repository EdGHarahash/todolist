Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :things
  resources :categories
  post "little_things/edit", to: "little_things#edit"
  root to: "home#index"
end
