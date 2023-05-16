Rails.application.routes.draw do
  root to: 'event#index'
  
  # resources :events, only:[:index, :new, :show]
  devise_for :users
 
end
