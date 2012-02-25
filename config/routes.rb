SignupSystem::Application.routes.draw do
  
  resources :pages do
    collection do
      get "test"
    end
  end
  
  root to: 'pages#index'

end
