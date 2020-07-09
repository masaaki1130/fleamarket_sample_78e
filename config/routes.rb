Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :products do
  collection do
    get 'search'
    get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
    get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
  end
end
  resources :users, only: :show
  resources :card, only: :index
  resources :mypage
  resources :logout, only: :index
end
