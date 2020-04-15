Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "registrations"
  }

  devise_scope :user do
    root to: "users/sessions#new"
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    get "/users/:id", to: "users/registrations#show", as: "user"
    get "/users/:id/edit", to: "users/registrations#edit", as: "edit_user"
    get "/users", to: "users/registrations#index", as: "users"
    patch "/users/:id", to: "users/registrations#update"
    put "/users/:id", to: "users/registrations#update"
    delete "/users/:id", to: "users/registrations#destroy"
  end

  resources :teams
  resources :servers
  resources :systems
end
