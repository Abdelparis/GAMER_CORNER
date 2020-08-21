Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get '/update-accepted/:id', to: 'rentings#update_accepted', as: 'accept'
  get '/update-accepted/:id', to: 'rentings#update_rejected', as: 'reject'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :board_games, only: [:index, :show, :new, :create] do
    resources :rentings, only: [:new, :create]
  end
end
