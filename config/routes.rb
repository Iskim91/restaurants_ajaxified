Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'cocktails#index'
  resources :doses, only: [:destroy]
  resources :cocktails do
    resources :doses, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
