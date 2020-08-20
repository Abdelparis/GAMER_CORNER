Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get '/renter', to: 'pages#dashboard_renter'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :board_games, only: [:index, :show, :new, :create] do
    resources :rentings, only: [:new, :create, :update]
  end
end
