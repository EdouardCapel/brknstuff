Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :items do
    resources :requests, only: [:index, :new, :create, :show]
  end

  resources :requests, only: [:update, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
