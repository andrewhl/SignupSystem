SignupSystem::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :pages do
    collection do
      get "test"
    end
  end
  
  root to: 'pages#index'

end
