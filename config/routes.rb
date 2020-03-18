Rails.application.routes.draw do
  get 'users/show'
  root to: 'home#index'
  get 'home/about'
  devise_for :users
  resources :codes
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
