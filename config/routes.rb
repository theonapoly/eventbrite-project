Rails.application.routes.draw do
  get 'users/show'
  root to: 'events#index'
  
  # resources :events, only:[:index, :new, :show]
  devise_for :users
 
end
