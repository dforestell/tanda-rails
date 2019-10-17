Rails.application.routes.draw do
  resources :users, only: [:create]
  get 'signup', to: 'users#new'
  resources :organizations, except: [:new]
  resources :organizations, only: [:show] do
    resources :users, only: [:update]
    resources :shifts, only: [:index, :create]
  end
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   delete 'logout', to: 'sessions#destroy'
   put 'leave-org', to: 'users#leave'
end
