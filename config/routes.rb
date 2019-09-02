Rails.application.routes.draw do
  resource :credits, only: [:create] do
    collection do
      post '/pay', to: 'credits#pay'
    end
  end

  devise_for :users
  devise_scope :user do
    post '/users/sign_up/payment_confirmation', to: 'users/registrations#payment_confirmation'
    get '/users/sign_up/complete', to: 'devise/registrations#complete'
    get '/users/logout', to: 'devise/registrations#user_logout'
  end

  resources :users, only: [:create, :show] do
    collection do
      get  :sign_up_sns
      get  :sign_up_user_info
      post :sign_up_phone
      post :sign_up_sms
      post :sign_up_shipping
      # post :sign_up_credit
      # post :sign_up_credit_create
    end
  end

  root 'items#index'
  get "items/hidden" => "items#hidden"

  resources :pictures, only: [:new, :create]
  resources :items, only: [:index, :show]

end
