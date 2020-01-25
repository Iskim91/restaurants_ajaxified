Rails.application.routes.draw do
  # root to: 'cocktails#index'
  get: '/' to: 'cocktails#index'
  devise_for :users
  resources :users, only: [:show]
  resources :doses, only: [:destroy]
  resources :cocktails do
    resources :reviews, only: :create
    resources :doses, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
