Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :products, only: [:new, :create]
  resources :users, only: :show

  get 'card/index', to: 'card#index'
  get 'mypage/index', to: 'mypage#index'
  get 'logout/index', to: 'logout#index'
end
