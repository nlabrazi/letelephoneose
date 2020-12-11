Rails.application.routes.draw do

  # this for 404/500 error pages
  get 'errors/not_found'
  get 'errors/internal_server_error'

  get "/404", to: "errors#not_found", :via => :all
  get "/500", to: "errors#internal_server_error", :via => :all


  devise_for :users

  root to: 'pages#home'
  get '/mentions', to: 'pages#mentions'

  resources :contacts, only: [:new, :create]
  get '/faq', to: 'pages#faq'

  resources :artists
  resources :services

  resources :availabilities do
    resources :orders do
      resources :charges
      put "/validate", to: "orders#validate"
      put "/refused", to: "orders#refused"
    end
  end
  resources :dashboard, only: [:index] do
    put "/update", to: "dashboard#update"
    put "/remove",  to: "dashboard#remove_artist"
  end
end
