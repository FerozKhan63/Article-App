Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :posts
  devise_for :users
  resources :articles do 
    resources :comments
  end
  resources :posts do 
    resources :comments
  end

  root to: "home#index"
end
