Rails.application.routes.draw do
  get 'static_pages/home'
  get 'users/new'
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post 'signup', to: 'users#create'
  
  resources :users

  resources :account_activations, only: [:edit]

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'generalposts', to: 'general_posts#index'

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
