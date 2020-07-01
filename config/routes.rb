Rails.application.routes.draw do
  devise_for :users
  resources :products, only: [:new, :create]
end
