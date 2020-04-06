Rails.application.routes.draw do
  resources :servers
  resources :systems
  
  root to: 'systems#index'
end
