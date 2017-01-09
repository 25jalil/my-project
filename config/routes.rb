Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end
    resources :comments
  end
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'calendar', to: 'posts#calendar'
  get 'tags', to: 'tags#index', as: :tags
  delete 'tags/:id', to: 'tags#destroy', as: :tags_remove

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  resources :categories, only: [:index, :create, :edit, :destroy]
  get '/categories/new/(:name, :parent_id)', to: 'categories#new', as: :new_category
  get 'results', to: 'results#index', as: 'results'
end
