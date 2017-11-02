Rails.application.routes.draw do
  resources :posts
  resources :blogs
  get 'admin/index'

  devise_for :users
  get 'home/index'
  root 'home#index'

  namespace :admin, module: nil  do
    root "admin#index"
    resources :users
    resources :posts
    resources :blogs
  end
  match '/auth/:provider/callback', :to => 'home#create', via: [:get, :post]
  match '/auth/failure', :to => 'home#failure', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
