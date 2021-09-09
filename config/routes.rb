Rails.application.routes.draw do
  #devise_for :users
  namespace :api, defaults: { format: :json } do
    post 'users/login', to: 'users#login'
    post 'sign_up', to: 'users#create', as: :sign_up
    resources :regions
    resources :products
    resources :orders
    resources :order_items
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
