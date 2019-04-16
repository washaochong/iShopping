Rails.application.routes.draw do
  root 'admin/products#index'

  namespace :admin do
    resource :products
  end
end
