Rails.application.routes.draw do
  resources :crags do
    resources :nodes
  end
end
