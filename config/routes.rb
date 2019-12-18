Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      post 'step2',    to:'signup#save_to_session_step1'
      get 'step3'
      post 'step3',    to:'signup#save_to_session_step2'
      get 'step4'
      post 'step4',    to:'signup#save_to_session_step3'
      get 'done'
    end
  end
  root to: 'items#index'

  resources :items, only: [:new]
  resources :users do
   member do
    get "logout"
    get "profile"
    get "userinfo"
   end
  end

  resources :items, only: [:index, :new, :create, :show, :edit, :update]

end
