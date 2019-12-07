Rails.application.routes.draw do
  devise_for :users
  resources :signup do
    collection do
      get 'step1'
      post 'step2'
      post 'step3'
      post 'step4'
      get 'done'
    end
  end
  root to: 'items#index'
end
