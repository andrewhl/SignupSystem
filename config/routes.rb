SignupSystem::Application.routes.draw do
  
  get "childs/new"

  get "childs/create"

  resources :users, :after_school_programs, :children, :asp_registrations
  resources :sessions, only: [:new, :create, :destroy]
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/after_school_programs/edit_all', to: 'after_school_programs#edit_all'
  match '/programs', to: 'pages#programs'

  resources :pages do
    collection do
      get "test"
    end
  end
  
  root to: 'pages#index'

end
