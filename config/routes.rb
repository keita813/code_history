Rails.application.routes.draw do
  get 'users/show'
  root to: 'home#index'
  get 'home/about'
  get 'users/withdraw'
  devise_for :users
  resources :codes
  resources :users, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
