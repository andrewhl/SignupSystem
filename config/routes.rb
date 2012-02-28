SignupSystem::Application.routes.draw do
  
  resources :users
  
  match '/signup',  to: 'users#new'

  resources :pages do
    collection do
      get "test"
    end
  end
  
  root to: 'pages#index'

end
