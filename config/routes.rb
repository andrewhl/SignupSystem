SignupSystem::Application.routes.draw do
  
  resources :users, :after_school_programs, :children
  resources :sessions, only: [:new, :create, :destroy]
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/after_school_programs/edit_all', to: 'after_school_programs#edit_all'

  resources :pages do
    collection do
      get "test"
    end
  end
  
  root to: 'pages#index'

end
