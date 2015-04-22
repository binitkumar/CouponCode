Rails.application.routes.draw do
  resources :referal_codes do
    collection do
      get :verify
      post :verification_result
    end
  end

  resources :hashtags do
    collection do
      get :validate
      post :validate_code
    end
  end

  devise_for :users
  root to: 'referal_codes#new'
end
