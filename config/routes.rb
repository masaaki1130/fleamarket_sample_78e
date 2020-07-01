Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :products, only: [:new, :create]
end
