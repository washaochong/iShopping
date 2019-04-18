Rails.application.routes.draw do
  root 'admin/products#new'

  namespace :admin do
    resources :products
  end
end
