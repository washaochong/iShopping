Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :cart_items
  resources :addresses

  resources :orders do
    resources :product_lists
  end

  resources :carts do
    collection do
      post :checkout
    end
  end

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

  namespace :account do
    resources :orders
  end

end
