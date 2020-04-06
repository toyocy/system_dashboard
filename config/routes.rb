Rails.application.routes.draw do
  resources :teams
  resources :servers
  resources :systems
  
  root to: 'systems#index'
end
