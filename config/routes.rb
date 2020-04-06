Rails.application.routes.draw do
  get "dashboard", to: 'static_pages#dashboard'
  
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }

  devise_scope :user do
    root to: "users/sessions#new"
    get "sign_in", to: "users/sessions#new"
    get "/users/sign_out", to: "users/sessions#destroy"
  end

  resources :teams
  resources :servers
  resources :systems
end
