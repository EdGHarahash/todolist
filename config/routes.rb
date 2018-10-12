Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :tasks
  post "sub_tasks/edit", to: "sub_tasks#edit"
  post "sub_tasks/create", to: "sub_tasks#create"
  root to: "home#index"
end
