Rails.application.routes.draw do
  get "dashboard", to: 'static_pages#dashboard'
  
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }

  devise_scope :user do
    root to: "users/sessions#new"
    get "sign_in", to: "users/sessions#new"
    get "/users/sign_out", to: "users/sessions#destroy"
    get "/users/:id", to: "users/sessions#show", as: "user"
    get "/users/:id/edit", to: "users/sessions#edit", as: "edit_user"
    patch "/users/:id", to: "users/sessions#update"
    put "/users/:id", to: "users/sessions#update"
  end

  resources :teams
  resources :servers
  resources :systems
end
