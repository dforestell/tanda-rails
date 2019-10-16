Rails.application.routes.draw do
  resources :users, only: [:create]
  get 'signup', to: 'users#new'
  resources :organizations
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   delete 'logout', to: 'sessions#destroy'
end
