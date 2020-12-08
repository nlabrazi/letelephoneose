Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get '/mentions', to: 'pages#mentions'
  
  resources :contacts, only: [:new, :create]

  resources :artists do
    resources :availabilities do
      resources :orders do
        put "/validate", to: "orders#validate"
        put "/refused", to: "orders#refused"
      end
    end
  end
  resources :dashboard, only: [:index]

end
