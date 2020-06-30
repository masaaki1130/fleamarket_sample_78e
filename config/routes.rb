Rails.application.routes.draw do
  resources :products, only: [:new, :create]
end
