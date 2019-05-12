Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :carts
  resources :cart_items
  resources :addresses

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products do
      get :publish
      get :unpublish
    end
  end
end
