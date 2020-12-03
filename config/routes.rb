Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get '/mentions', to: 'pages#mentions'

  resources :artists do
    resources :orders
  end
  resources :dashboard_artists, only: [:show]
  resources :availabilities, only: [:create, :show, :destroy]


end
