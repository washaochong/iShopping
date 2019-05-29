Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :cart_items
  resources :addresses

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
      post :apply_to_cancel
    end
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
    resources :orders do
      member do
        post :ship
        post :deliver
        post :return_good
        post :cancel
      end
    end
    resources :products do
      get :publish
      get :unpublish
    end
  end

  namespace :account do
    resources :orders
  end

end
