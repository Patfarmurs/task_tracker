Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'
  
  resources :tasks do
    patch :toggle_completed, on: :member
  end
  
  resources :goals
  
  get 'dashboard', to: 'dashboard#index'
end
