Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  resources :categories, only: [:index, :create, :edit, :destroy]
  get '/categories/new/(:name, :parent_id)', to: 'categories#new', as: :new_category
end
