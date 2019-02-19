Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  resources :requests, only: :index

  resources :items do
    resources :requests, only: [:new, :create, :show]
  end

  resources :requests, only: [:update, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
