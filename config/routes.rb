Rails.application.routes.draw do
  get 'static_pages/home'
  get 'users/new'
  get 'sessions/new'
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post 'signup', to: 'users#create'
  
  resources :users

  resources :account_activations, only: [:edit]

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'generalposts', to: 'general_posts#index'
  
  get 'users/edit', to: 'users#edit'

  #####SALEKH'S ROUTES #########
  get 'posts', to: "posts#index"
  get 'posts/new', to:"posts#new"
  post 'posts', to:"posts#create"
  delete 'posts/:id', to:"posts#destroy", as: :delete_post
  get 'posts/:id', to:"posts#show", as: :post
  get 'posts/:id/edit', to:"posts#edit", as: :edit_post
  patch 'posts/:id', to:"posts#update"
  
  get '/search' => 'posts#search', :as => 'search_page'
end
