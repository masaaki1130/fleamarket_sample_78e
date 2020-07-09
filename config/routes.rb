Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destinations'
    post 'destinations', to: 'users/registrations#create_destinations'
  end

  root 'items#index'

  resources :products, only: [:new, :create] do
    collection do
      get 'search'
    end
  end

end
resources :items do
  collection do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
  end
  member do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
  end
end
  resources :users, only: :show
  resources :user
  resources :card, only: :index
  resources :mypage
  resources :logout, only: :index
end
