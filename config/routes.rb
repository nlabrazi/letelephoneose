Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get '/mentions', to: 'pages#mentions'

  resources :artists
  resources :services

  resources :availabilities do
    resources :orders
  end
  resources :dashboard, only: [:index] do
    put "/update", to: "dashboard#update"
  end
