Rails.application.routes.draw do
  root to: 'events#index'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }


  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :users, only:[:show]
  # resources :events
end

