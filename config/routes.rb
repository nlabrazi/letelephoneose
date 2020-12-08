Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get '/mentions', to: 'pages#mentions'

  resources :artists do
    resources :availabilities do
      resources :orders
    end
  end
  resources :dashboard, only: [:index]

  resources :charges

end

