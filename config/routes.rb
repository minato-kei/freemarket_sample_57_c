Rails.application.routes.draw do
  resource :credits, only: [:create] do
    collection do
      post '/pay', to: 'credits#pay'
    end
  end

  devise_for :users
  resources :users, only: [:create, :show] do
    collection do
      get  :sign_up_sns
      get  :sign_up_user_info
      post :sign_up_phone
      post :sign_up_sms
      post :sign_up_shipping
      post :sign_up_credit
      get  :sign_up_complete
    end
  end

  root 'items#index'
  get "items/hidden" => "items#hidden"
  
  resources :users, only: [:show, :edit] do
    member do
      get  :profile
    end
  end

  resources :pictures, only: [:new, :create]
  resources :items, only: [:index, :show, :new]
  resources :purchases, only: [:new]

end
