Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destinations'
    post 'destinations', to: 'users/registrations#create_destinations'
  end

  root 'items#index'
  
  resources :products do
  collection do
    get 'search'
    get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
    get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
  end
end

  resources :user
  resources :card, only: :index
  resources :mypage
  resources :logout, only: :index
end
