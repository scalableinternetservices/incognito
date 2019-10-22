Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get  '/signup',  to: 'users#new'
  
  resources :users

  resources :account_activations, only: [:edit]

end
