Rails.application.routes.draw do
  devise_for :users

  get "/myitems", to: "items#myitems"
  get "/myrequests", to: "requests#myrequests"

  root to: 'items#index'

  resources :requests, only: [:index, :update, :edit, :destroy]

  resources :items do
    resources :requests, only: [:new, :create, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
