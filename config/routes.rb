Rails.application.routes.draw do
  root to: "site#index"

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"

  get "/posts", to: "posts#index", as: "posts"
  get "/posts/:id", to: "posts#show", as: "post"
end
