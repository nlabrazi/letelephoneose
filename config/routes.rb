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
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
end

