Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :products, only: [:new, :create] do
  collection do
    get 'search'
  end
end
  resources :users, only: :show
  resources :card, only: :index
  resources :mypage
  resources :logout, only: :index
end
