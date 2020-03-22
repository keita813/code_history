Rails.application.routes.draw do
  get 'users/show'
  root to: 'home#index'
  get 'home/about'
  get 'users/withdraw'
  # 検索後のページ
  get 'codes/search', to: 'codes#search'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :codes do
   resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
