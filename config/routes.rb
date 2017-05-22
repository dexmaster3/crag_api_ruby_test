Rails.application.routes.draw do
  resources :crags do
    resources :nodes
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
