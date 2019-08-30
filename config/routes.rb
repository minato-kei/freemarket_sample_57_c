Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    get '/users/sign_up/sns_confirmation', to: 'devise/registrations#sns_confirmation'
    get '/users/sign_up/phone_confirmation', to: 'devise/registrations#phone_confirmation'
    get '/users/sign_up/user_information_confirmation', to: 'devise/registrations#user_information_confirmation'
    get '/users/sign_up/shipping_confirmation', to: 'devise/registrations#shipping_confirmation'
    get '/users/sign_up/payment_confirmation', to: 'devise/registrations#payment_confirmation'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:show]
  resources :pictures, only: [:new, :create]
end
