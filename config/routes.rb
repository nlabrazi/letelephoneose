Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get '/mentions', to: 'pages#mentions'

  resources :artists
  resources :services

  resources :availabilities do
    resources :orders do
      put "/validate", to: "orders#validate"
      put "/refused", to: "orders#refused"
    end
  end
  resources :dashboard, only: [:index] do
    put "/update", to: "dashboard#update"
  end
end