Rails.application.routes.draw do
  get "products/buy_confirmation/:id", to: 'products#buy_confirmation', as: 'buy_confirmation'
  get 'purchase/index/:id', to: 'purchase#index', as: 'index'
  post 'pay/:id', to: 'purchase#pay'
  get 'purchase/done/:id', to: 'purchase#done'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destinations'
    post 'destinations', to: 'users/registrations#create_destinations'
  end

  root 'products#index'

  resources :products do
    collection do
      get 'search'
      get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      post 'purchase'
      get 'purchased'
      get 'buy'
    end
  end

  resources :products do
    get "buy/confirmation", to: 'products#buy_confirmation'
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :products do
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end

  resources :user
  resources :mypage
  resources :logout, only: :index
end

